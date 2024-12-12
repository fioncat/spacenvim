local M = {}

M.setup = function()
	local diagnostics_virtual_text = require("core.settings").diagnostics_virtual_text
	local diagnostics_level = require("core.settings").diagnostics_level

	local nvim_lsp = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")
	require("lspconfig.ui.windows").default_options.border = "rounded"

	require("mason-lspconfig").setup({
		ensure_installed = require("core.settings").lsp_deps,
	})

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		underline = true,
		virtual_text = diagnostics_virtual_text and {
			severity = {
				min = vim.diagnostic.severity[diagnostics_level],
			},
		} or false,
		-- set update_in_insert to false because it was enabled by lspsaga
		update_in_insert = false,
	})

	local opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}

	---A handler to setup all servers defined under `completion/servers/*.lua`
	---@param lsp_name string
	local function mason_lsp_handler(lsp_name)
		local ok, custom_handler = pcall(require, "user.configs.lsp-servers." .. lsp_name)
		-- Use preset if there is no user definition
		if not ok then
			ok, custom_handler = pcall(require, "completion.servers." .. lsp_name)
		end
		if not ok then
			-- Default to use factory config for server(s) that doesn't include a spec
			nvim_lsp[lsp_name].setup(opts)
			return
		elseif type(custom_handler) == "function" then
			--- Case where language server requires its own setup
			local opts = custom_handler(opts)
			nvim_lsp[lsp_name].setup(opts)
		elseif type(custom_handler) == "table" then
			nvim_lsp[lsp_name].setup(vim.tbl_deep_extend("force", opts, custom_handler))
		else
			vim.notify(
				string.format(
					"Failed to setup [%s].\n\nServer definition under `completion/servers` must return\neither a fun(opts) or a table (got '%s' instead)",
					lsp_name,
					type(custom_handler)
				),
				vim.log.levels.ERROR,
				{ title = "nvim-lspconfig" }
			)
		end
	end

	-- Fix: https://github.com/neovim/neovim/issues/30985
	for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
		local default_diagnostic_handler = vim.lsp.handlers[method]
		vim.lsp.handlers[method] = function(err, result, context, config)
			if err ~= nil and err.code == -32802 then
				return
			end
			return default_diagnostic_handler(err, result, context, config)
		end
	end

	mason_lspconfig.setup_handlers({ mason_lsp_handler })
end

return M
