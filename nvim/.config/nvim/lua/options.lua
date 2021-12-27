local set = vim.opt
local setlocal = vim.opt_local

set.relativenumber = true -- Set relative number = offset distance from current line
set.number = true -- Show current line number
set.tabstop = 4 -- Number of columns occupied by a tab
set.softtabstop = 4 -- Set multiple spaces as tabstops
set.expandtab = true -- Converts tabs to white space
set.autoindent = true -- Indent the new line same level as previous line
set.shiftwidth = 4 -- Width for autoindent
set.clipboard = "unnamedplus" -- Using system clipboard
set.incsearch = true -- Incremental highlight while searching
setlocal.wrap = false -- No wrap line
set.swapfile = false -- Disable creating new swap file
set.scrolloff = 10 -- Keeping the cursor in the center while scrolling
