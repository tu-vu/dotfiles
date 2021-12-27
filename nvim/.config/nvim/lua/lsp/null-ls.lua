local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local function buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local on_attach = function(client, bufnr)
	vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
	vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
	vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
	vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
	vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
	vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
	vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
	vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
	vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
	vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

	buf_set_keymap(bufnr, "n", "gd", ":LspDef<CR>")
	buf_set_keymap(bufnr, "n", "gr", ":LspRename<CR>")
	buf_set_keymap(bufnr, "n", "gy", ":LspTypeDef<CR>")
	buf_set_keymap(bufnr, "n", "K", ":LspHover<CR>")
	buf_set_keymap(bufnr, "n", "[a", ":LspDiagPrev<CR>")
	buf_set_keymap(bufnr, "n", "]a", ":LspDiagNext<CR>")
	buf_set_keymap(bufnr, "n", "ga", ":LspCodeAction<CR>")
	buf_set_keymap(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
	buf_set_keymap(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

	-- Automatically format on save
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		diagnostics.eslint_d,
		code_actions.eslint_d,
		formatting.prettierd,
		formatting.stylua,
	},
	on_attach = on_attach,
})
