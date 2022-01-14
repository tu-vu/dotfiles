local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

HOME = vim.fn.expand("$HOME")

local sumneko_root_path = HOME .. "/tools/lua-language-server"
local sumneko_binary = HOME .. "/tools/lua-language-server/bin/macOS/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local M = {}
M.setup = function(on_attach, capabilities)
	lspconfig.sumneko_lua.setup({
		cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
