return function()
	vim.g.rustaceanvim = {
		tools = { -- rust-tools options
		},

		server = {
			standalone = true,
			default_settings = {
				["rust-analyzer"] = {
					completion = {
						callable = {
							snippets = "none",
						},
					},
				},
			},
		}, -- rust-analyer options

		-- debugging stuff
		dap = {},
	}
end
