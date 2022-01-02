local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

local sources = {
	diagnostics.eslint,
	code_actions.eslint,
	formatting.prettier,
	formatting.stylua,
}

local M = {}
M.setup = function(on_attach)
	null_ls.setup({
		sources = sources,
		on_attach = on_attach,
	})
end

return M
