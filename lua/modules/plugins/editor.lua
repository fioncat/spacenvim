local editor = {}

editor["rmagatti/auto-session"] = {
	lazy = true,
	cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
	config = require("editor.auto-session"),
}

editor["m4xshen/autoclose.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("editor.autoclose"),
}

editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.better-escape"),
}

editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}

editor["junegunn/vim-easy-align"] = {
	lazy = true,
	cmd = "EasyAlign",
}

editor["phaazon/hop.nvim"] = {
	lazy = true,
	branch = "v2",
	event = "BufReadPost",
	config = require("editor.hop"),
}

editor["RRethy/vim-illuminate"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.vim-illuminate"),
}

----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() ~= 0 then
			vim.api.nvim_command("TSUpdate")
		end
	end,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.treesitter"),
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "mfussenegger/nvim-treehopper" },
		{ "andymass/vim-matchup" },
		{
			"windwp/nvim-ts-autotag",
			config = require("editor.autotag"),
		},
		{
			"abecodes/tabout.nvim",
			config = require("editor.tabout"),
		},
		{
			"terrortylor/nvim-comment",
			config = require("editor.comment"),
		},
	},
}

return editor
