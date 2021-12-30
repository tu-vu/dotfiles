local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local u = require("utils")

local ts_utils = require("nvim-lsp-ts-utils")
local ts_utils_settings = {
	enable_import_on_completion = true,
	update_imports_on_move = true,
	-- filter out dumb module warning
	filter_out_diagnostics_by_code = { 80001 },
}

local M = {}
M.setup = function(on_attach, capabilities)
	lspconfig.tsserver.setup({
		root_dir = lspconfig.util.root_pattern("package.json"),
		init_options = ts_utils.init_options,
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)

			ts_utils.setup(ts_utils_settings)
			ts_utils.setup_client(client)

			u.buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
			u.buf_map(bufnr, "n", "gI", ":TSLspRenameFile<CR>")
			u.buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
		end,
		capabilities = capabilities,
	})
end

return M
