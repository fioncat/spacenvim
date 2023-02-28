local lang = {}

lang["fatih/vim-go"] = {
	lazy = true,
	ft = "go",
	config = require("lang.vim-go"),
}

lang["simrat39/rust-tools.nvim"] = {
	lazy = true,
	ft = "rust",
	config = require("lang.rust-tools"),
	dependencies = { "nvim-lua/plenary.nvim" },
}

lang["chrisbra/csv.vim"] = {
	lazy = true,
	ft = "csv",
}

return lang
