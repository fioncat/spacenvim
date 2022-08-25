local M = {}

-- A completion engine plugin for neovim written in Lua. Completion
-- sources are installed from external repositories and "sourced".
M["hrsh7th/nvim-cmp"] = {
	event = "InsertEnter",
	requires = {
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
		{ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
		{ "andersevenrud/cmp-tmux", after = "cmp-nvim-lua" },
		{ "hrsh7th/cmp-path", after = "cmp-tmux" },
		{ "f3fora/cmp-spell", after = "cmp-path" },
		{ "hrsh7th/cmp-buffer", after = "cmp-spell" },
		{ "kdheepak/cmp-latex-symbols", after = "cmp-buffer" },
	},
	config = require("plugins.cmp.cmp"),
}

-- Code Snippets supports.
M["L3MON4D3/LuaSnip"] = {
	after = "nvim-cmp",
	config = require("plugins.cmp.snip"),
	requires = "rafamadriz/friendly-snippets",
}

-- A super powerful autopair plugin for Neovim that supports multiple
-- characters.
M["windwp/nvim-autopairs"] = {
	after = "nvim-cmp",
	config = require("plugins.cmp.autopairs"),
}

return M
