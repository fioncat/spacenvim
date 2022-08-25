return function()
	vim.g.navic_silence = true

	require("nvim-navic").setup({
		icons = {
			Method = " ",
			Function = " ",
			Constructor = " ",
			Field = " ",
			Variable = " ",
			Class = "ﴯ ",
			Interface = " ",
			Module = " ",
			Property = "ﰠ ",
			Enum = " ",
			File = " ",
			EnumMember = " ",
			Constant = " ",
			Struct = " ",
			Event = " ",
			Operator = " ",
			TypeParameter = " ",
			Namespace = " ",
			Object = " ",
			Array = " ",
			Boolean = " ",
			Number = " ",
			Null = "ﳠ ",
			Key = " ",
			String = " ",
			Package = " ",
		},
		highlight = true,
		separator = " > ",
		depth_limit = 0,
		depth_limit_indicator = "..",
	})
end
