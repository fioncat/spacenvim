local lang = {}

lang["mhartington/formatter.nvim"] = {
	lazy = true,
	cmd = { "Format", "FormatWrite" },
	config = require("lang.formatter"),
}

lang["simrat39/rust-tools.nvim"] = {
	lazy = true,
	ft = "rust",
	config = require("lang.rust-tools"),
	dependencies = { "nvim-lua/plenary.nvim" },
}

return lang
