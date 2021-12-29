local fn = vim.fn

-- Automatically install packer on any machine you clone configuration to
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever plugins.lua updates
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Plugin mangager written in Lua

	-- LSP
	use("neovim/nvim-lspconfig") -- Neovim's built-in LSP
	use("jose-elias-alvarez/null-ls.nvim") -- Formatters and linters
	use("jose-elias-alvarez/nvim-lsp-ts-utils") -- Useful utilities for TypeScript
	use("b0o/schemastore.nvim") -- Simple access to schemastore

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter", -- Treesiter configs for Neovim
		run = ":TSUpdate",
	})

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer", -- Buffer completions
			"hrsh7th/cmp-path", -- Path completions
			"hrsh7th/cmp-cmdline", -- Command mode completions
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
		},
	})

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Comment
	use({
		"numToStr/Comment.nvim", -- Integrate with nvim-ts-context-commentstring
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring", -- Makes jsx comments actually work
		config = function()
			require("nvim-treesitter.configs").setup({
				context_commentstring = {
					enable = true,
				},
			})
		end,
	})

	-- Telescope - Neovim fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- better algorithm
		},
	})

	-- Colorschemes
	use("navarasu/onedark.nvim") -- Nice colorscheme written in Lua

	-- Productivity
	use("windwp/nvim-autopairs") -- Autocomplete pairs, integerates with both cmp and treesitter
	use({ "windwp/nvim-ts-autotag" }) -- Autocomplete tags
	use("tpope/vim-surround") -- Tags editing
	use({
		"folke/trouble.nvim", -- Pretty list of diagnostic, references, etc.
		config = function()
			require("trouble").setup()
		end,
	})

	-- Misc
	use("nvim-lua/plenary.nvim") -- Useful Lua functions used by lots of plugins
	use("kyazdani42/nvim-web-devicons") -- Icons
	use("iamcco/markdown-preview.nvim") -- Markdown Preview

	-- Automatically set up configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
