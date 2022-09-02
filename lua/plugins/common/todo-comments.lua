return function()
	require("todo-comments").setup {
		signs = true,
		highlight = {
			before = "", -- "fg" or "bg" or empty
			keyword = "bg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
			after = "", -- "fg" or "bg" or empty
			comments_only = true, -- uses treesitter to match keywords in comments only
			max_line_len = 400, -- ignore lines longer than this
			exclude = {}, -- list of file types to exclude highlighting
			pattern = [[.*<(KEYWORDS)[^:]*:]],
		},
	}
end
