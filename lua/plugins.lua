local packer = require('packer')

return packer.startup(function ()
	-- Init packer plugin manager.
	packer.init({
		git = { clone_timeout = 60, default_url_format = "git@github.com:%s" },
		disable_commands = true,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	})

	-- 01. Common plugins.

	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim"
	use { "nvim-lua/popup.nvim", opt = true }

	use {
		-- The catppuccin theme, we will use it as the default theme.
		"catppuccin/nvim",
		opt = false,
		as = "catppuccin",
		config = require("config.catppuccin"),
	}

	use {
		-- A fancy, configurable, notification manager. Replace the native `vim.notify()` function.
		"rcarriga/nvim-notify",
		opt = false,
		config = require("config.notify"),
	}

	use {
		-- The file tree plugin.
		"kyazdani42/nvim-web-devicons",
		opt = false,
	}
	use {
		"kyazdani42/nvim-tree.lua",
		opt = true,
		cmd = { 
			"NvimTreeToggle",
			"NvimTreeFindFile",
			"NvimTreeFocus",
			"NvimTreeResize",
		},
		config = require("config.tree"),
	}

	use {
		-- The start dashboard.
		"goolord/alpha-nvim",
		opt = true,
		event = "BufWinEnter",
		config = require("config.alpha"),
	}

	use {
		-- Indent the blankline (required treesitter to indent context).
		"lukas-reineke/indent-blankline.nvim",
		opt = true,
		event = "BufReadPost",
		config = require("config.indent-blankline"),
	}

	use {
		-- The bufferline at the top of the editor.
		"akinsho/bufferline.nvim",
		opt = true,
		tag = "*",
		event = "BufReadPost",
		config = require("config.bufferline"),
	}

	use {
		-- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few
		-- keystrokes as possible.
		"phaazon/hop.nvim",
		opt = true,
		branch = "v1",
		event = "BufReadPost",
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	}

	use {
		-- A smooth scrolling neovim plugin written in lua.
		"karb94/neoscroll.nvim",
		opt = true,
		event = "BufReadPost",
		config = require("config.neoscroll"),
	}

	use {
		-- Use Term and VTerm to split terminal.
		"vimlab/split-term.vim",
		opt = true,
		cmd = { "Term", "VTerm" },
	}

	use {
		-- Better-escape.vim is created to help Vim/Nvim users escape insert mode quickly using their
		-- customized key combinations, without experiencing the lag.
		"jdhao/better-escape.vim",
		opt = true,
		event = "InsertEnter",
	}

	use {
		-- Auto Session takes advantage of Neovim's existing session management capabilities to provide
		-- seamless automatic session management.
		"rmagatti/auto-session",
		opt = true,
		cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
		config = require("config.auto-session"),
	}

	use {
		-- Show where your cursor moves when jumping large distances (e.g between windows). Fast and lightweight,
		-- written completely in Lua.
		"edluffy/specs.nvim",
		opt = true,
		event = "CursorMoved",
		config = require("config.specs"),
	}

	use {
		-- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
		"sindrets/diffview.nvim",
		opt = true,
		cmd = { "DiffviewOpen" },
	}

	use {
		-- A more adventurous wildmenu.
		"gelguy/wilder.nvim",
		event = "CmdlineEnter",
		config = require("config.wilder"),
		requires = { { "romgrk/fzy-lua-native", after = "wilder.nvim" } },
	}

	use {
		-- This plugin is a replacement for the included filetype.vim that is sourced on startup.
		"nathom/filetype.nvim",
		config = require("config.filetype"),
	}

	use {
		-- Clean buffers.
		"fioncat/vim-bufclean",
		opt = true,
		cmd = { "BufClean" }
	}

	use {
		-- A git blame plugin for (neo)vim inspired by VS Code's GitLens plugin.
		"APZelos/blamer.nvim",
		opt = true,
		event = "BufEnter",
		config = function()
			vim.g.blamer_enabled = 1
		end,
	}

	-- 02. Treesitter plugins set.
	
	use {
		-- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface
		-- for tree-sitter in Neovim and to provide some basic functionality such as highlighting.
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		run = ":TSUpdate",
		event = "BufRead",
		config = require("config.treesitter"),
	}

	use {
		-- Syntax aware text-objects, select, move, swap, and peek support.
		"nvim-treesitter/nvim-treesitter-textobjects",
		opt = true,
		after = "nvim-treesitter",
	}

	use {
		-- A Neovim plugin for setting the commentstring option based on the cursor location in the file.
		-- The location is checked via treesitter queries.
		"JoosepAlviste/nvim-ts-context-commentstring",
		opt = true,
		after = "nvim-treesitter",
	}
	use {
		-- Toggle comments in Neovim. We use `nvim-ts-context-commentstring` to complete the comment.
		"terrortylor/nvim-comment",
		opt = false,
		config = function()
			require("nvim_comment").setup({
				hook = function()
					require("ts_context_commentstring.internal").update_commentstring()
				end,
			})
		end,
	}

	use {
		-- Highlight, navigate, and operate on sets of matching text. It extends vim's % key to
		-- language-specific words instead of just single characters.
		"andymass/vim-matchup",
		opt = true,
		after = "nvim-treesitter",
		config = function()
			vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
		end
	}

	use {
		-- Search tools, use telescope.
		-- All these plugins are based on telescope, and may requires some system commands.
		"nvim-telescope/telescope.nvim",
		opt = true,
		module = "telescope",
		cmd = "Telescope",
		config = require("config.telescope"),
	}

	use {
		-- fzf-native is a c port of fzf. It only covers the algorithm and implements few
		-- functions to support calculating the score.
		"nvim-telescope/telescope-fzf-native.nvim",
		opt = true,
		run = "make",
		after = "telescope.nvim",
	}

	use {
		-- An extension for telescope.nvim that allows you to switch between projects.
		"nvim-telescope/telescope-project.nvim",
		opt = true,
		after = "telescope-fzf-native.nvim",
	}

	use {
		-- A telescope.nvim extension that offers intelligent prioritization when selecting
		-- files from your editing history. (Using sqlite)
		"nvim-telescope/telescope-frecency.nvim",
		opt = true,
		after = "telescope-project.nvim",
		requires = { { "tami5/sqlite.lua", opt = true } },
	}

	-- 03. LSP and Completion plugins.

	use {
		-- Configs for the Nvim LSP client (:help lsp).
		"neovim/nvim-lspconfig",
		opt = true,
		event = "BufReadPre",
		config = require("config.lsp"),
	}
	use {
		-- Portable package manager for Neovim that runs everywhere Neovim runs.
		-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
		"williamboman/mason.nvim",
		requires = {
			{ "williamboman/mason-lspconfig.nvim" },
		}
	}
	use {
		-- Show function signature when you type.
		"ray-x/lsp_signature.nvim",
		opt = true,
		after = "nvim-lspconfig"
	}
	use {
		-- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI.
		"glepnir/lspsaga.nvim",
		opt = true,
		after = "nvim-lspconfig",
		requires = { { "antoinemadec/FixCursorHold.nvim", opt = true } },
		config = require("config.lspsaga"),
	}
	use {
		-- A simple statusline/winbar component that uses LSP to show your current code context.
		-- Named after the Indian satellite navigation system.
		"SmiteshP/nvim-navic",
		opt = true,
		after = "nvim-lspconfig",
		config = require("config.navic"),
	}
	use {
		-- A blazing fast and easy to configure Neovim statusline written in Lua.
		"hoob3rt/lualine.nvim",
		opt = true,
		after = { "nvim-navic" },
		config = require("config.lualine"),
	}
	use {
		-- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
		"j-hui/fidget.nvim",
		opt = true,
		event = "BufReadPost",
		config = function()
			require("fidget").setup({})
		end,
	}

	use {
		-- A completion engine plugin for neovim written in Lua. Completion sources are
		-- installed from external repositories and "sourced".
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		requires = {
			{ "lukas-reineke/cmp-under-comparator" },
			{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
			{ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
			{ "andersevenrud/cmp-tmux", after = "cmp-nvim-lua" },
			{ "hrsh7th/cmp-path", after = "cmp-tmux" },
			{ "f3fora/cmp-spell", after = "cmp-path" },
			{ "hrsh7th/cmp-buffer", after = "cmp-spell" },
			{ "kdheepak/cmp-latex-symbols", after = "cmp-buffer" },
		},
		config = require("config.completion"),
	}
	use {
		-- Code Snippets supports.
		"L3MON4D3/LuaSnip",
		after = "nvim-cmp",
		config = require("config.snip"),
		requires = "rafamadriz/friendly-snippets",
	}
	use {
		-- A super powerful autopair plugin for Neovim that supports multiple characters.
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = require("config.autopairs"),
	}

	-- 04. Languages support

	use {
		"fioncat/vim-minigo",
		config = function ()
			vim.api.nvim_command([[autocmd FileType go nnoremap gat :GoAddTags ]])
			vim.api.nvim_command([[autocmd FileType go nnoremap grt :GoRemoveTags ]])
			vim.api.nvim_command([[autocmd FileType go nnoremap gfs :GoFillStruct<CR>]])
			vim.api.nvim_command([[autocmd FileType go nnoremap gw :call go#fmt#Format(1)<CR>]])
			-- vim.api.nvim_command([[autocmd BufWriteCmd *.go call go#fmt#Format(1)]])
		end,
	}

	use {
		"sebdah/vim-delve",
		config = function ()
			vim.api.nvim_command([[autocmd FileType go nnoremap <leader>db :DlvToggleBreakpoint<CR>]])
			vim.api.nvim_command([[autocmd FileType go nnoremap <leader>dt :DlvToggleTracepoint<CR>]])
			vim.api.nvim_command([[autocmd FileType go nnoremap <leader>dc :DlvClearAll<CR>]])
			vim.api.nvim_command([[autocmd FileType go nnoremap <leader>dd :DlvDebug -- ]])
			vim.api.nvim_command([[autocmd FileType go nnoremap <leader>dr :DlvTest -- -test.run]])
		end
	}

end)
