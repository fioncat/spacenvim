return function()
	require("smart-splits").setup({
		-- Ignored buffer types (only while resizing)
		ignored_buftypes = {
			"nofile",
			"quickfix",
			"prompt",
		},
		-- Ignored filetypes (only while resizing)
		ignored_filetypes = { "NvimTree" },
		-- the default number of lines/columns to resize by at a time
		default_amount = 3,
	})
end
