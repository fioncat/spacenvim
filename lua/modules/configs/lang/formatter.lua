return function()
	require("formatter").setup({
		-- Enable or disable logging
		logging = true,
		-- Set the log level
		log_level = vim.log.levels.WARN,

		filetype = {
			go = {
				require("formatter.filetypes.go").goimports,
			},
			rust = {
				require("formatter.filetypes.rust").rustfmt,
			},
			python = {
				require("formatter.filetypes.python").yapf,
			},
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	})
end
