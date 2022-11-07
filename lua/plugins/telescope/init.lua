local M = {}

-- telescope.nvim is a highly extendable fuzzy finder over lists.
-- Built on the latest awesome features from neovim core.
-- Telescope is centered around modularity, allowing for easy
-- customization.
M["nvim-telescope/telescope.nvim"] = {
	opt = true,
	module = "telescope",
	cmd = "Telescope",
	config = require("plugins.telescope.telescope"),
}

-- fzf-native is a c port of fzf. It only covers the algorithm and
-- implements few functions to support calculating the score.
M["nvim-telescope/telescope-fzf-native.nvim"] = {
	opt = true,
	run = "make",
	after = "telescope.nvim",
}

-- An extension for telescope.nvim that allows you to switch between
-- projects.
M["nvim-telescope/telescope-project.nvim"] = {
	opt = true,
	after = "telescope-fzf-native.nvim",
}

-- A telescope.nvim extension that offers intelligent prioritization
-- when selecting files from your editing history. (Using sqlite)
M["nvim-telescope/telescope-frecency.nvim"] = {
	opt = true,
	after = "telescope-project.nvim",
	requires = { { "tami5/sqlite.lua", opt = true } },
}

return M
