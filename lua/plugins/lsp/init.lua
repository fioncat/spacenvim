local M = {}

-- Configs for the Nvim LSP client (:help lsp).
M["neovim/nvim-lspconfig"] = {
	opt = true,
	event = "BufReadPre",
	config = require("plugins.lsp.lspconfig"),
}

-- Portable package manager for Neovim that runs everywhere Neovim runs.
-- Easily install and manage LSP servers, DAP servers, linters, and
-- formatters.
M["williamboman/mason.nvim"] = {
	requires = {
		{ "williamboman/mason-lspconfig.nvim" },
	},
}

-- Show function signature when you type.
M["ray-x/lsp_signature.nvim"] = {
	opt = true,
	after = "nvim-lspconfig",
}

-- A light-weight lsp plugin based on neovim's built-in lsp with a
-- highly performant UI.
M["glepnir/lspsaga.nvim"] = {
	opt = true,
	after = "nvim-lspconfig",
	requires = { { "antoinemadec/FixCursorHold.nvim", opt = true } },
	config = require("plugins.lsp.lspsaga"),
}

-- A simple statusline/winbar component that uses LSP to show your
-- current code context. Named after the Indian satellite navigation
-- system.
M["SmiteshP/nvim-navic"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = require("plugins.lsp.navic"),
}

-- A blazing fast and easy to configure Neovim statusline written in Lua.
M["hoob3rt/lualine.nvim"] = {
	opt = true,
	after = { "nvim-navic" },
	config = require("plugins.lsp.lualine"),
}

-- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
M["j-hui/fidget.nvim"] = {
	opt = true,
	event = "BufReadPost",
	config = function()
		require("fidget").setup({})
	end,
}

return M
