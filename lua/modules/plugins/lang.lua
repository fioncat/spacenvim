local lang = {}

lang["mhartington/formatter.nvim"] = {
	lazy = true,
	cmd = { "Format", "FormatWrite" },
	config = require("lang.formatter"),
}

lang["mrcjkb/rustaceanvim"] = {
	lazy = true,
	ft = "rust",
	version = "^4",
	config = require("lang.rust-tools"),
	dependencies = { "nvim-lua/plenary.nvim" },
}

lang["Saecki/crates.nvim"] = {
	lazy = true,
	event = "BufReadPost Cargo.toml",
	config = require("lang.crates"),
	dependencies = { "nvim-lua/plenary.nvim" },
}

return lang
