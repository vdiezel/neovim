local fn = vim.fn

-- Automatically install packer
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

-- markers for the root directory
vim.cmd([[
  function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  endfunction

  command! ProjectFiles execute 'GFiles' s:find_git_root()
]])
vim.cmd([[
  set rtp+=~/.fzf
]])

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "numToStr/Comment.nvim" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "kyazdani42/nvim-tree.lua" }
  -- use { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" }
	-- use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim" }
  use { "ahmedkhalf/project.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "goolord/alpha-nvim" }
	use { "folke/which-key.nvim" }

	-- Colorschemes
  use { "ellisonleao/gruvbox.nvim" }
  use {"ntk148v/komau.vim"}
  use { "axvr/photon.vim" }
  use { "mcchrish/zenbones.nvim" }
  use { "rktjmp/lush.nvim" }

  -- Comfort
  use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
  use { "tpope/vim-surround" }
  use { "vim-test/vim-test" }
  use { "HUAHUAI23/nvim-quietlight" }
  -- use { "airblade/vim-rooter" } -- prevents telescope to change the lookup path
  -- use { "tpope/vim-dispatch" }

	-- Cmp
  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
	use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" }
	use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

	-- Snippets
  -- use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine
  -- use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

	-- LSP
	use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim" } -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" }
	use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" }

	-- Telescope
	-- use { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }
  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "junegunn/fzf.vim" }

  -- Text Search
  use { "rking/ag.vim" }

  -- replace
  use { "windwp/nvim-spectre" }

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
	}

	-- Git
	use { "lewis6991/gitsigns.nvim" }

  -- Lua
  use { "~/.config/nvim/lua/user/custom_plugins/todo.nvim", as = "todo"}

  -- gistory
  use { "vdiezel/gistory.nvim" }

  -- C++
  use { "bfrg/vim-cpp-modern" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
