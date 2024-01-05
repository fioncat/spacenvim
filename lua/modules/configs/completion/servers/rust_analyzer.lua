-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
return {
	-- standalone file support
	-- setting it to false may improve startup time
	standalone = true,
	settings = {
		["rust-analyzer"] = {
			completion = {
				callable = {
					snippets = "none",
				},
			},
		},
	},
}
