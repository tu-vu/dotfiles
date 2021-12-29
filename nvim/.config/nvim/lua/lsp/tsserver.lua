local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local M = {}
M.setup = function(on_attach, capabilities)
	lspconfig.tsserver.setup({
		on_attach = function(client, buffer)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false

			on_attach(client, buffer)
		end,
		capabilities = capabilities,
		filetypes = {},
	})
end

return M
