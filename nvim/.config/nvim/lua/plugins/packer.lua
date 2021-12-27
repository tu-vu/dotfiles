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

return require("packer").startup(function()
	use("wbthomason/packer.nvim") -- Plugin mangager written in Lua

	-- LSP
	use("neovim/nvim-lspconfig") -- Neovim's built-in LSP
	use("jose-elias-alvarez/null-ls.nvim") -- Formatters and linters

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
	use("hrsh7th/vim-vsnip") -- VSCode snippet

	-- Comment
	use("numToStr/Comment.nvim") -- Integrate with nvim-ts-context-commentstring
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Makes jsx comments actually work

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", requires = {
		"nvim-telescope/telescope-fzf-native.nvim",
	} })

	-- Colorschemes
	use("navarasu/onedark.nvim") -- Nice colorscheme written in Lua

	-- Productivity
	use("windwp/nvim-autopairs") -- Autocomplete pairs, integerates with both cmp and treesitter
	use({ "windwp/nvim-ts-autotag", ft = { "typescript", "typescriptreact" } }) -- Autocomplete tags
	use("tpope/vim-surround") -- Tags editing

	-- Misc
	use("nvim-lua/plenary.nvim") -- Useful Lua functions used by lots of plugins
	use("iamcco/markdown-preview.nvim") -- Markdown Preview

	-- Automatically set up configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
