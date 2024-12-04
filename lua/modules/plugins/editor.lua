local editor = {}

editor["m4xshen/autoclose.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("editor.autoclose"),
}

editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}

editor["numToStr/Comment.nvim"] = {
	lazy = false,
	config = require("editor.comment"),
}

editor["junegunn/vim-easy-align"] = {
	lazy = true,
	cmd = "EasyAlign",
}

editor["smoka7/hop.nvim"] = {
	version = "*",
	config = require("editor.hop"),
}

editor["RRethy/vim-illuminate"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.vim-illuminate"),
}

-- Search and replace
editor["nvim-pack/nvim-spectre"] = {
	lazy = true,
	cmd = { "Spectre" },
}

----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() ~= 0 then
			vim.api.nvim_command([[TSUpdate]])
		end
	end,
	event = "BufReadPre",
	config = require("editor.treesitter"),
	dependencies = {
		{ "andymass/vim-matchup" },
		{ "mfussenegger/nvim-treehopper" },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{
			"abecodes/tabout.nvim",
			config = require("editor.tabout"),
		},
		{
			"windwp/nvim-ts-autotag",
			config = require("editor.autotag"),
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = require("editor.ts-context"),
		},
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			config = require("editor.ts-context-commentstring"),
		},
	},
}

return editor
