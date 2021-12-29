local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

local u = require("utils")

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

CustomFindFiles = function() -- fall back to find_files if git_files can't find .git
	local ok = pcall(require("telescope.builtin").git_files)
	if not ok then
		require("telescope.builtin").find_files()
	end
end

-- commands
u.lua_command("Files", "CustomFindFiles()")
u.command("Rg", "Telescope live_grep")
u.command("Browser", "Telescope file_browser")
u.command("HelpTags", "Telescope help_tags")
u.command("Buffers", "Telescope buffers")

-- bindings
u.nmap("sf", "<cmd>Files<CR>")
u.nmap("ss", "<cmd>Rg<CR>")
u.nmap("sb", "<cmd>Browser<CR>")
u.nmap("sh", "<cmd>HelpTags<CR>")
u.nmap("<Leader><Leader>", "<cmd>Buffers<CR>")

-- lsp
u.command("LspRef", "Telescope lsp_references")
u.command("LspDef", "Telescope lsp_definitions")
u.command("LspAct", "Telescope lsp_code_actions")
u.command("LspRangeAct", "Telescope lsp_range_code_actions")
