local M = {}

M.setup = function()
	local diagnostics_virtual_lines = require("core.settings").diagnostics_virtual_lines
	local diagnostics_level = require("core.settings").diagnostics_level
	local lsp_deps = require("core.settings").lsp_deps

	require("lspconfig.ui.windows").default_options.border = "rounded"
	require("mason-lspconfig").setup({
		ensure_installed = require("core.settings").lsp_deps,
	})

	vim.diagnostic.config({
		signs = true,
		underline = false,
		virtual_text = false,
		virtual_lines = diagnostics_virtual_lines and {
			severity = {
				min = vim.diagnostic.severity[diagnostics_level],
			},
		} or false,
		-- set update_in_insert to false because it was enabled by lspsaga
		update_in_insert = false,
	})

	local opts = {
		capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities()
		),
	}

	---A handler to setup all servers defined under `completion/servers/*.lua`
	---@param lsp_name string
	local function mason_lsp_handler(lsp_name)
		if not lsp_name or lsp_name == "" then
			return
		end
		local ok, custom_handler = pcall(require, "user.configs.lsp-servers." .. lsp_name)
		local default_ok, default_handler = pcall(require, "completion.servers." .. lsp_name)
		-- Use preset if there is no user definition
		if not ok then
			ok, custom_handler = default_ok, default_handler
		end

		if not ok then
			-- Default to use factory config for server(s) that doesn't include a spec
			vim.lsp.config(lsp_name, opts)
			vim.lsp.enable(lsp_name)
		elseif type(custom_handler) == "function" then
			--- Case where language server requires its own setup
			local opts = custom_handler(opts)
			vim.lsp.config(lsp_name, opts)
			vim.lsp.enable(lsp_name)
		elseif type(custom_handler) == "table" then
			vim.lsp.config(
				lsp_name,
				vim.tbl_deep_extend(
					"force",
					opts,
					type(default_handler) == "table" and default_handler or {},
					custom_handler
				)
			)
			vim.lsp.enable(lsp_name)
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

	for _, lsp in ipairs(lsp_deps) do
		mason_lsp_handler(lsp)
	end
end

return M
