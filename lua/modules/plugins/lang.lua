local lang = {}

lang["mhartington/formatter.nvim"] = {
	lazy = true,
	cmd = { "Format", "FormatWrite" },
	config = require("lang.formatter"),
}

lang["Saecki/crates.nvim"] = {
	lazy = true,
	event = "BufReadPost Cargo.toml",
	config = require("lang.crates"),
	dependencies = { "nvim-lua/plenary.nvim" },
}

return lang
