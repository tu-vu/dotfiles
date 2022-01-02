local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local M = {}
M.setup = function(on_attach, capabilities)
	lspconfig.eslint.setup({
		root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js"),
		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = true
			on_attach(client, bufnr)
		end,
		capabilities = capabilities,
		setting = {
			format = {
				enable = true,
			},
		},
	})
end

return M
