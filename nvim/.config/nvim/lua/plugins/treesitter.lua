require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	sync_install = false, -- Install languages synchronously (only applied to `ensure_installed`)
	highlight = { enable = true },

	-- plugins
	autopairs = { enable = true },
	autotag = {
		enable = true,
	},
})
