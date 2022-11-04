local M = {}

-- The catppuccin theme, we will use it as the default theme.
M["catppuccin/nvim"] = {
	opt = false,
	as = "catppuccin",
	config = require("plugins.common.catppuccin"),
}

-- A fancy, configurable, notification manager.
-- Replace the native `vim.notify()` function.
M["rcarriga/nvim-notify"] = {
	opt = false,
	config = require("plugins.common.notify"),
}

-- icons for filetree.
M["kyazdani42/nvim-web-devicons"] = {
	opt = false,
}

-- filetree.
M["kyazdani42/nvim-tree.lua"] = {
	opt = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeFindFile",
		"NvimTreeFocus",
		"NvimTreeResize",
	},
	config = require("plugins.common.tree"),
}

-- The start dashboard.
M["goolord/alpha-nvim"] = {
	opt = true,
	event = "BufWinEnter",
	config = require("plugins.common.alpha"),
}

-- The bufferline at the top of the editor.
M["akinsho/bufferline.nvim"] = {
	opt = true,
	tag = "*",
	event = "BufReadPost",
	config = require("plugins.common.bufferline"),
}

-- Hop is an EasyMotion-like plugin allowing you to jump anywhere 
-- in a document with as few keystrokes as possible.
M["phaazon/hop.nvim"] = {
	opt = true,
	branch = "v1",
	event = "BufReadPost",
	config = function()
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}

-- A smooth scrolling neovim plugin written in lua.
M["karb94/neoscroll.nvim"] = {
	opt = true,
	event = "BufReadPost",
	config = require("plugins.common.neoscroll"),
}

-- Use Term and VTerm to split terminal.
M["vimlab/split-term.vim"] = {
	opt = true,
	cmd = { "Term", "VTerm" },
}

-- Better-escape.vim is created to help Vim/Nvim users escape insert
-- mode quickly using their customized key combinations, without
-- experiencing the lag.
M["jdhao/better-escape.vim"] = {
	opt = true,
	event = "InsertEnter",
}

-- Auto Session takes advantage of Neovim's existing session management
-- capabilities to provide seamless automatic session management.
M["rmagatti/auto-session"] = {
	opt = true,
	cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
	config = require("plugins.common.auto-session"),
}

-- Show where your cursor moves when jumping large distances (e.g between
-- windows). Fast and lightweight, written completely in Lua.
M["edluffy/specs.nvim"] = {
	opt = true,
	event = "CursorMoved",
	config = require("plugins.common.specs"),

}

-- Single tabpage interface for easily cycling through diffs for all
-- modified files for any git rev.
M["sindrets/diffview.nvim"] = {
	opt = true,
	cmd = { "DiffviewOpen" },
}

-- A more adventurous wildmenu.
M["gelguy/wilder.nvim"] = {
	event = "CmdlineEnter",
	config = require("plugins.common.wilder"),
	requires = { { "romgrk/fzy-lua-native", after = "wilder.nvim" } },
}

-- This plugin is a replacement for the included filetype.vim that is
-- sourced on startup.
M["nathom/filetype.nvim"] = {
	config = require("plugins.common.filetype"),
}

-- Clean buffers.
M["fioncat/vim-bufclean"] = {
	opt = true,
	cmd = { "BufClean" }
}

-- Super fast git decorations implemented purely in lua/teal.
M["lewis6991/gitsigns.nvim"] = {
	opt = true,
	event = { "BufReadPost", "BufNewFile" },
	config = require("plugins.common.gitsigns"),
}

-- The plug-in visualizes undo history and makes it easier to browse and
-- switch between different undo branches.
M["mbbill/undotree"] = {
	opt = true,
	cmd = "UndotreeToggle",
}

-- Neovim plugin to stabilize buffer content on window open/close events.
-- There is a currently outstanding PR to Neovim core that supercedes this plugin:
--     https://github.com/neovim/neovim/pull/19243
-- After this is merged, this plugin can be removed.
M["luukvbaal/stabilize.nvim"] = {
	opt = true,
	event = "BufReadPost",
}

-- WhichKey is a lua plugin for Neovim 0.5 that displays a popup with
-- possible key bindings of the command you started typing.
-- Heavily inspired by the original emacs-which-key and vim-which-key.
M["folke/which-key.nvim"] = {
	config = require("plugins.common.which-key"),
}

-- Fugitive is the premier Vim plugin for Git.
M["tpope/vim-fugitive"] = {
	opt = true,
	cmd = { "Git", "G" },
}

-- todo-comments is a lua plugin for Neovim 0.5 to highlight and search
-- for todo comments like TODO, HACK, BUG in your code base.
M["folke/todo-comments.nvim"] = {
	event = { "BufReadPost", "BufNewFile" },
	config = require("plugins.common.todo-comments"),
}

return M
