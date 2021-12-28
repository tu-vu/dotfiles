local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

local function buf_set_keymap(...)
	vim.api.nvim_buf_set_keymap(bufnr, ...)
end

-- Mappings
local opts = { noremap = true, silent = true }
buf_set_keymap("n", "sf", "<cmd>Telescope find_files<CR>", opts)
buf_set_keymap("n", "sg", "<cmd>Telescope live_grep<CR>", opts)
buf_set_keymap("n", "sb", "<cmd>Telescope file_browser<CR>", opts)
buf_set_keymap("n", "sh", "<cmd>Telescope help_tags<CR>", opts)
buf_set_keymap("n", "<Leader><Leader>", "<cmd>Telescope buffers<CR>", opts)

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

telescope.load_extension("fzf", opts)
