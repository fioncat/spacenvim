local function make_capabilities()
	---@class rustaceanvim.ClientCapabilities: lsp.ClientCapabilities
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- snippets
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	-- send actions with hover request
	---@class rustaceanvim.ExperimentalCapabilities
	capabilities.experimental = {
		hoverActions = true,
		hoverRange = true,
		serverStatusNotification = true,
		snippetTextEdit = true,
		codeActionGroup = true,
		ssr = true,
	}

	-- enable auto-import
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = { "documentation", "detail", "additionalTextEdits" },
	}

	-- rust analyzer goodies
	local experimental_commands = {
		"rust-analyzer.runSingle",
		"rust-analyzer.showReferences",
		"rust-analyzer.gotoLocation",
		"editor.action.triggerParameterHints",
	}

	---@class rustaceanvim.ExperimentalCommandCapabilities
	capabilities.experimental.commands = {
		commands = experimental_commands,
	}

	return capabilities
end

-- See: https://rust-analyzer.github.io/manual.html#configuration
return function(opts)
	opts.capabilities = make_capabilities()
	opts.settings = {
		["rust-analyzer"] = {
			completion = {
				callable = {
					snippets = "none",
				},
			},
			checkOnSave = true,
			check = {
				enable = true,
				command = "clippy",
				features = "all",
			},
			procMacro = {
				enable = true,
			},
		},
	}

	return opts
end
