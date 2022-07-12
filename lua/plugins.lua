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

	use "wbthomason/packer.nvim"

	use {
		-- Devicons
		"kyazdani42/nvim-web-devicons",
		commit = "e3294f687626b40754bb40ac2d636d166098b2fb"
	}

	use {
		-- Theme catppuccin
		"catppuccin/nvim",
		as = "catppuccin",
		config = require("config.catppuccin"),
		commit = "406fdf2f2d2372df52d503e9f7bef96d89901c9f"
	}

	use {
		-- filetree
		'kyazdani42/nvim-tree.lua',
		config = require("config.tree"),
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		commit = "df92f1527f30d19fbf3474af2badc0636a2d70bf",
	}

	use {
		-- Syntax highlight
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		run = ":TSUpdate",
		event = "BufRead",
		config = require("config.syntax"),
		commit = "3e99302082489b36480e3b1eeceed763331e790f"
	}

	use {
		-- highlight some special match like if/endif in bash, function/end in lua, etc
		"andymass/vim-matchup",
		opt = true,
		config = function()
			-- popup match when it is offscreen.
			vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
		end,
		after = "nvim-treesitter",
		commit = "71739b54228eaa79344b02d46a61d88c2be1b234"
	}

	use {
		-- highlight object
		"nvim-treesitter/nvim-treesitter-textobjects",
		opt = true,
		after = "nvim-treesitter",
		commit = "fea609aa58b3390a09e8df0e96902fd4b094d8b7"
	}

	use {
		-- highlight indent blank
		"lukas-reineke/indent-blankline.nvim",
		opt = true,
		event = "BufRead",
		after = "nvim-treesitter",
		config = require("config.indent-blankline"),
		commit = "2e35f7dcdc72f39b37c21e43cdb538d7a41c7e07"
	}

	use {
		-- highlight position in statusline
		"SmiteshP/nvim-gps",
		opt = true,
		after = "nvim-treesitter",
		config = require("config.gps"),
		commit = "6afd8f7a69e7008dabe048d4fb1ee8e467a72fdf"
	}

	use {
		-- Show LSP info in statusline
		"arkav/lualine-lsp-progress",
		opt = true,
		after = "nvim-gps",
		commit = "56842d097245a08d77912edf5f2a69ba29f275d7"
	}

	use {
		-- statusline
		"hoob3rt/lualine.nvim",
		opt = true,
		after = "lualine-lsp-progress",
		config = require("config.statusline"),
		commit = "6a3d367449fac10ed9d9ee356e8f02ba1ca941f6"
	}

	use {
		-- bufline
		"akinsho/nvim-bufferline.lua",
		opt = true,
		event = "BufRead",
		config = require("config.bufline"),
		commit = "305d4fd693b6ebcb9ac95cf16c0693ce64960162"
	}

	use {
		-- quick align
		"junegunn/vim-easy-align",
		opt = true,
		cmd = "EasyAlign",
		commit = "12dd6316974f71ce333e360c0260b4e1f81169c3"
	}

	use {
		-- quick comment/uncomment
		"terrortylor/nvim-comment",
		opt = false,
		config = function()
			require("nvim_comment").setup({
				hook = function()
					require("ts_context_commentstring.internal").update_commentstring()
				end,
			})
		end,
		commit = "f670649da497de12aa3d5afc0a693d5d50b17d85"
	}

	use {
		"JoosepAlviste/nvim-ts-context-commentstring",
		opt = true,
		after = "nvim-treesitter",
		commit = "097df33c9ef5bbd3828105e4bee99965b758dc3f",
	}

	use {
		-- quick jump
		"phaazon/hop.nvim",
		opt = true,
		cmd = {
			"HopLine",
			"HopLineStart",
			"HopWord",
			"HopPattern",
			"HopChar1",
			"HopChar2",
		},
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
		commit = "75f73d3959a0df7ef3642fd5138acdb1ce50fdc8",
	}

	use {
		-- scroll smoothly
		"karb94/neoscroll.nvim",
		opt = true,
		event = "WinScrolled",
		config = require("config.neoscroll"),
		commit = "07242b9c29eed0367cb305d41851b2e04de9052e"

	}

	use {
		-- open internal terminal with ":Term" and ":VTerm" commands.
		"vimlab/split-term.vim",
		opt = true,
		cmd = { "Term", "VTerm" },
		commit = "a4e28cab77ad07fc8a0ebb62a982768c02eb287c"
	}

	use {
		-- customize the behaviour of internal terminal.
		"akinsho/nvim-toggleterm.lua",
		opt = true,
		event = "BufRead",
		config = require("config.terminal"),
		commit = "d2ceb2ca3268d09db3033b133c0ee4642e07f059"
	}

	use {
		-- escape insert mode quickly.
		"jdhao/better-escape.vim",
		opt = true,
		event = "InsertEnter",
		commit = "6b16a45a839727977277f6ab11bded63e9ed86bb"
	}

	use {
		-- Git manager
		"tpope/vim-fugitive",
		opt = true,
		cmd = { "Git", "G" },
		commit = "c29ef11cd6478da675678265e76f9e527843876f"
	}

	use {
		-- delete buffers.
		"famiu/bufdelete.nvim",
		opt = true,
		cmd = { "Bdelete", "Bwipeout", "Bdelete!", "Bwipeout!" },
		commit = "1c59b784c53afaf7b9ca63186da99e5d46e3e429"
	}

	use {
		-- popfix lib for lua. (used by other plugins)
		"RishabhRD/popfix",
		opt = false,
		commit = "f3571e676739208871bd38f9fa0fddf554b6a7a8",
	}

	use {
		-- some tools for lua. (used by other plugins)
		"nvim-lua/plenary.nvim",
		opt = false,
		commit = "66472128c3191b786966798fc956a689705ab1be"
	}

	use {
		-- Amazing search tools!
		"nvim-telescope/telescope.nvim",
		opt = true,
		module = "telescope",
		cmd = "Telescope",
		config = require("config.search"),
		requires = {
			{ "nvim-lua/plenary.nvim", opt = false },
			{ "nvim-lua/popup.nvim", opt = true },
		},
		commit = "88229d5afd23c2325544e8625b111093fed6554b",
	}

	use {
		-- Use C-compiled fzf, speed up telescope.
		"nvim-telescope/telescope-fzf-native.nvim",
		opt = true,
		run = "make",
		after = "telescope.nvim",
		commit = "b8662b076175e75e6497c59f3e2799b879d7b954"
	}

	use {
		-- Search across different projects.
		"nvim-telescope/telescope-project.nvim",
		opt = true,
		after = "telescope-fzf-native.nvim",
		commit = "d317c3cef6917d650d9a638c627b54d3e1173031"
	}

	use {
		-- Cache data in sqlite, speed up telescope.
		"nvim-telescope/telescope-frecency.nvim",
		opt = true,
		after = "telescope-project.nvim",
		requires = {{
			"tami5/sqlite.lua",
			opt = true,
			commit = "d53bdff134a81e12834c3f7bd431376482132b7c"
		}},
		commit = "979a6f3d882b7b5352cc6a751faa9c9427d40e74"
	}

	use {
		-- optimize the opening speed of some files
		"nathom/filetype.nvim",
		opt = false,
		config = function()
			-- In init.lua or filetype.nvim's config file
			require("filetype").setup({
				overrides = {
					shebang = {
						-- Set the filetype of files with a dash shebang to sh
						dash = "sh",
					},
				},
			})
		end,
		commit = "4d2c0d4488a05f9b0d18a7e2004c0182e350bb45"
	}

	use {
		-- Show the error list
		"folke/trouble.nvim",
		opt = true,
		cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
		config = require("config.error"),
		commit = "20469be985143d024c460d95326ebeff9971d714"
	}

	use {
		-- Delete buffers.
		"fioncat/vim-bufclean",
		opt = true,
		cmd = { "BufClean" }
	}

	use {
		"neovim/nvim-lspconfig",
		opt = true,
		event = "BufReadPre",
		config = require("config.lsp"),
		commit = "0da0023374a2acbab25e538383006f1404bf3c0d"
	}

	use {
		"williamboman/nvim-lsp-installer",
		opt = true,
		after = "nvim-lspconfig",
		commit = "1dd5a25a61c38d3b5c72f74a3358d97764ad79e1"
	}

	use {
		"tami5/lspsaga.nvim",
		opt = true,
		after = "nvim-lspconfig",
		commit = "511a335b470aa32ceb6ba8d53d61f6b52362c6f4"
	}

	use {
		"ray-x/lsp_signature.nvim",
		opt = true,
		after = "nvim-lspconfig",
		commit = "ee290010800a5af43ca7b59987718b540a0b2b38"
	}

	use {
		"hrsh7th/nvim-cmp",
		config = require("config.completion"),
		event = "InsertEnter",
		requires = {
			{
				"lukas-reineke/cmp-under-comparator",
				commit = "6857f10272c3cfe930cece2afa2406e1385bfef8"
			},
			{
				"saadparwaiz1/cmp_luasnip",
				after = "LuaSnip",
				commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36"
			},
			{
				"hrsh7th/cmp-nvim-lsp",
				after = "cmp_luasnip",
				commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8"
			},
			{
				"hrsh7th/cmp-nvim-lua",
				after = "cmp-nvim-lsp",
				commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21"
			},
			{
				"andersevenrud/cmp-tmux",
				after = "cmp-nvim-lua",
				commit = "3c16f7e73abee43b3ea3e919e8b34c24427d9530"
			},
			{
				"hrsh7th/cmp-path",
				after = "cmp-tmux",
				commit = "981baf9525257ac3269e1b6701e376d6fbff6921"
			},
			{
				"f3fora/cmp-spell",
				after = "cmp-path",
				commit = "5602f1a0de7831f8dad5b0c6db45328fbd539971"
			},
			{
				"hrsh7th/cmp-buffer",
				after = "cmp-spell",
				commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323"
			},
			{
				"kdheepak/cmp-latex-symbols",
				after = "cmp-buffer",
				commit = "46e7627afa8c8ff57158d1c29d721d8efebbc39f"
			},
		},
		commit = "9897465a7663997b7b42372164ffc3635321a2fe"
	}

	use {
		"L3MON4D3/LuaSnip",
		after = "nvim-cmp",
		config = require("config.snip"),
		requires = {{
			"rafamadriz/friendly-snippets",
			commit = "0e516c9d9892d6bf268492136971d315dd704d16"
		}},
		commit = "7d78278c2a935b8cd1b6b43065223e14490f3133"
	}

	use {
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("nvim-autopairs").setup({})

			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
			cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
		end,
		commit = "784398a8f184431fd4329f20b0e4f52e87707bbd"
	}

	use {
		"APZelos/blamer.nvim",
		opt = true,
		event = "BufEnter",
		config = function()
			vim.g.blamer_enabled = 1
		end,
		commit = "f4eb22a9013642c411725fdda945ae45f8d93181",
	}

	use {
		"glepnir/dashboard-nvim",
		config = require("config.dashboard"),
		event = "BufWinEnter",
		comment = "bb0d5019dcac944896582787684ab03b5225ff2d"
	}

	use {
		"fioncat/vim-minigo",
		config = function ()
			vim.api.nvim_command([[autocmd FileType go nnoremap gat :GoAddTags ]])
			vim.api.nvim_command([[autocmd FileType go nnoremap grt :GoRemoveTags ]])
			vim.api.nvim_command([[autocmd FileType go nnoremap gfs :GoFillStruct<CR>]])
			vim.api.nvim_command([[autocmd BufWriteCmd *.go call go#fmt#Format(1)]])
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
