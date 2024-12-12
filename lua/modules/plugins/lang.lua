local lang = {}

local minimal_mode = os.getenv("NVIM_MINI") == "true"
if minimal_mode then
	return lang
end

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
