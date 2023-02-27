local ui = {}

ui["goolord/alpha-nvim"] = {
	lazy = true,
	event = "BufWinEnter",
	config = require("ui.alpha"),
}

ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
}

ui["catppuccin/nvim"] = {
	lazy = false,
	name = "catppuccin",
	config = require("ui.catppuccin"),
}

ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	config = require("ui.gitsigns"),
}

ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}

ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}

ui["zbirenbaum/neodim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.neodim"),
}

ui["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.neoscroll"),
}

ui["rcarriga/nvim-notify"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("ui.notify"),
}

ui["edluffy/specs.nvim"] = {
	lazy = true,
	event = "CursorMoved",
	config = require("ui.specs"),
}

return ui
