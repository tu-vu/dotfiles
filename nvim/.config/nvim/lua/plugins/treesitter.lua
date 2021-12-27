require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = { enable = true },

	-- plugins
	autopairs = { enable = true },
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
