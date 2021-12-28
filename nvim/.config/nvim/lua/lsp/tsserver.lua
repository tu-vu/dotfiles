local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(bufnr, mode, lhs, rhs, opts)
		vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
			noremap = true,
			silent = true,
		})
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")

	-- Formatting

	-- Avoid formatting conflict by disabling native formatter
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
})
