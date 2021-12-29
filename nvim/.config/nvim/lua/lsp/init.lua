local u = require("utils")

local on_attach = function(client, bufnr)
	-- commands
	u.lua_command("LspDef", "vim.lsp.buf.definition()")
	u.lua_command("LspFormatting", "vim.lsp.buf.formatting()")
	u.lua_command("LspCodeAction", "vim.lsp.buf.code_action()")
	u.lua_command("LspHover", "vim.lsp.buf.hover()")
	u.lua_command("LspRename", "vim.lsp.buf.rename()")
	u.lua_command("LspRefs", "vim.lsp.buf.references()")
	u.lua_command("LspTypeDef", "vim.lsp.buf.type_definition()")
	u.lua_command("LspImplementation", "vim.lsp.buf.implementation()")
	u.lua_command("LspDiagPrev", "vim.diagnostic.goto_prev()")
	u.lua_command("LspDiagNext", "vim.diagnostic.goto_next()")
	u.lua_command("LspDiagLine", "vim.diagnostic.open_float()")
	u.lua_command("LspSignatureHelp", "vim.lsp.buf.signature_help()")

	-- bindings
	u.buf_map(bufnr, "n", "gr", ":LspRename<CR>")
	u.buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
	u.buf_map(bufnr, "n", "K", ":LspHover<CR>")
	u.buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
	u.buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
	u.buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
	u.buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

	-- Telescope
	u.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
	u.buf_map(bufnr, "n", "gi", ":LspRef<CR>")
	u.buf_map(bufnr, "n", "ga", ":LspAct<CR>")
	u.buf_map(bufnr, "v", "ga", "<Esc><cmd> LspRangeAct<CR>")

	-- Automatically format on save
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

for _, server in ipairs({
	"tsserver",
	"null-ls",
	"jsonls",
	"sumneko_lua",
}) do
	require("lsp." .. server).setup(on_attach, capabilities)
end
