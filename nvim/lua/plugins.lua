-- auto install packer if not installed
local os_name = vim.loop.os_uname().sysname

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	-- colorscheme's
	use("bluz71/vim-nightfly-guicolors")
	use("phha/zenburn.nvim")
	use("cpea2506/one_monokai.nvim")
	use("arcticicestudio/nord-vim")
	use("folke/tokyonight.nvim")
	-- use('ellisonleao/gruvbox.nvim')
	use("morhetz/gruvbox")
	use("patstockwell/vim-monokai-tasty")
	use("rebelot/kanagawa.nvim")
	use("sainnhe/everforest")
	use("sainnhe/sonokai")
	use("ayu-theme/ayu-vim")
	use("Rigellute/rigel")
	use("raphamorim/lucario")
	use("gertjanreynaert/cobalt2-vim-theme")
	use({ "kyoz/purify", rtp = "vim" })
	use("kvrohit/rasmus.nvim")
	use("savq/melange-nvim")
	use({ "lalitmee/cobalt2.nvim", requires = "tjdevries/colorbuddy.nvim" })
	use("karoliskoncevicius/sacredforest-vim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("mhartington/oceanic-next")
	use("sainnhe/gruvbox-material")
	use("fenetikm/falcon")
	use("LunarVim/darkplus.nvim")
	use("NLKNguyen/papercolor-theme")
	use("junegunn/seoul256.vim")
	use({ "sonph/onehalf", rtp = "vim" })
	use("jacoborus/tender.vim")
	use({ "pineapplegiant/spaceduck", branch = "main" })
	use("ribru17/bamboo.nvim")

	use("p00f/nvim-ts-rainbow") -- works with treesitter
	-- use('luochen1990/rainbow') -- rainbow parentheses, doesn't work when treesitter installed?
	use("mechatroner/rainbow_csv") -- rainbow csv

	use("norcalli/nvim-colorizer.lua")

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	use("akinsho/bufferline.nvim")

	-- statusline
	use("nvim-lualine/lualine.nvim")
	-- use { 'feline-nvim/feline.nvim'}

	-- fuzzy finding w/ telescope
	if os_name == "Darwin" or os_name == "Linux" then
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	elseif os_name == "Windows_NT" then
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		})
	end
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use("hrsh7th/cmp-nvim-lua") -- for autocompletion

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	-- use({
	-- 	"glepnir/lspsaga.nvim",
	-- 	branch = "main",
	-- 	requires = {
	-- 		{ "nvim-tree/nvim-web-devicons" },
	-- 		{ "nvim-treesitter/nvim-treesitter" },
	-- 	},
	-- }) -- enhanced lsp uis
	-- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	use("RRethy/vim-illuminate")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- Only install these plugins if ctags are installed on the system
	use({ "liuchengxu/vista.vim", cmd = "Vista" })

	-- use({ "neoclide/coc.nvim", branch = "release" })

	-- indentation guide
	use("lukas-reineke/indent-blankline.nvim")

	-- Python indent (follows the PEP8 style)
	use({ "Vimjas/vim-python-pep8-indent", ft = { "python" } })

	-- use "stylua-nvim/stylua.nvim"

	-- python formatters
	-- use({ "psf/black", branch = "stable" })

	use({ "nvim-neotest/nvim-nio" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- Python-related text object
	-- use({ 'jeetsukumaran/vim-pythonsense', ft = { 'python' } })

	use("ervandew/supertab")

	-- use("m4xshen/smartcolumn.nvim")
	use("Bekaboo/deadcolumn.nvim")

	use("folke/which-key.nvim")

	use({
		"johnfrankmorgan/whitespace.nvim",
		config = function()
			require("whitespace-nvim").setup({
				-- configuration options and their defaults

				-- `highlight` configures which highlight is used to display
				-- trailing whitespace
				highlight = "DiffDelete",

				-- `ignored_filetypes` configures which filetypes to ignore when
				-- displaying trailing whitespace
				ignored_filetypes = { "TelescopePrompt", "Trouble", "help" },
			})

			-- remove trailing whitespace with a keybinding
			-- vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
		end,
	})

	-- install without yarn or npm
	-- use({
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = function()
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- })

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
