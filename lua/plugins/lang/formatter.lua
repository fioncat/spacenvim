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
		},
	})
end
