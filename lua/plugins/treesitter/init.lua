local M = {}

-- The goal of nvim-treesitter is both to provide a simple and easy
-- way to use the interface for tree-sitter in Neovim and to provide
-- some basic functionality such as highlighting.
M["nvim-treesitter/nvim-treesitter"] = {
	opt = true,
	event = "BufRead",
	config = require("plugins.treesitter.treesitter"),
}

-- Syntax aware text-objects, select, move, swap, and peek support.
M["nvim-treesitter/nvim-treesitter-textobjects"] = {
	opt = true,
	after = "nvim-treesitter",
}

-- A Neovim plugin for setting the commentstring option based on the
-- cursor location in the file. The location is checked via treesitter
-- queries.
M["JoosepAlviste/nvim-ts-context-commentstring"] = {
	opt = true,
	after = "nvim-treesitter",
}

-- Toggle comments in Neovim. We use `nvim-ts-context-commentstring`
-- to complete the comment.
M["terrortylor/nvim-comment"] = {
	opt = false,
	config = function()
		require("nvim_comment").setup({
			hook = function()
				require("ts_context_commentstring.internal").update_commentstring()
			end,
		})
	end,
}

-- Highlight, navigate, and operate on sets of matching text. It
-- extends vim's % key to language-specific words instead of just
-- single characters.
M["andymass/vim-matchup"] = {
	opt = true,
	after = "nvim-treesitter",
}

-- Indent the blankline (required treesitter to indent context).
M["lukas-reineke/indent-blankline.nvim"] = {
	opt = true,
	event = "BufReadPost",
	config = require("plugins.treesitter.indent-blankline"),
}

return M
