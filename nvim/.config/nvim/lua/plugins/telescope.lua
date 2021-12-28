local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

local function nvim_set_keymap(mode, lhs, rhs, opts)
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts or {
		noremap = true,
		silent = true,
	})
end

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
		},
	},
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})

telescope.load_extension("fzf")

custom = function() -- fall back to find_files if git_files can't find .git
	local ok = pcall(require("telescope.builtin").git_files)
	if not ok then
		require("telescope.builtin").find_files()
	end
end

local opts = { noremap = true, silent = true }
nvim_set_keymap("n", ",f", "<cmd>lua custom()<CR>")
nvim_set_keymap("n", ",s", "<cmd>Telescope live_grep<CR>")
nvim_set_keymap("n", ",b", "<cmd>Telescope file_browser<CR>")
nvim_set_keymap("n", ",h", "<cmd>Telescope help_tags<CR>")
nvim_set_keymap("n", "<Leader><Leader>", "<cmd>Telescope buffers<CR>")
