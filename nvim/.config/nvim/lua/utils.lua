local api = vim.api

local custom_options = { noremap = true, silent = true }

local M = {}

M.map = function(mode, target, source, opts)
	api.nvim_set_keymap(mode, target, source, opts or custom_options)
end

for _, mode in ipairs({ "n", "o", "i", "x", "t" }) do
	M[mode .. "map"] = function(...)
		M.map(mode, ...)
	end
end

M.buf_map = function(buffer, mode, target, source, opts)
	api.nvim_buf_set_keymap(buffer or 0, mode, target, source, opts or custom_options)
end

M.command = function(name, fn)
	vim.cmd(string.format("command! %s %s", name, fn))
end

M.lua_command = function(name, fn)
	M.command(name, "lua" .. fn)
end

return M
