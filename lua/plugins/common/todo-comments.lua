return function ()
	require("todo-comments").setup {
		signs = true,
		highlight = {
			keyword = "bg",
			after = "fg",
		},
    }
end
