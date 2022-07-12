return function()
	vim.cmd([[packadd nvim-lsp-installer]])
	vim.cmd([[packadd lsp_signature.nvim]])
	vim.cmd([[packadd lspsaga.nvim]])
	vim.cmd([[packadd cmp-nvim-lsp]])

	local nvim_lsp = require("lspconfig")
	local saga = require("lspsaga")
	local lsp_installer = require("nvim-lsp-installer")

	-- Override diagnostics symbol

	saga.init_lsp_saga({
		error_sign = "",
		warn_sign = "",
		hint_sign = "",
		infor_sign = "",
	})

	lsp_installer.settings({
		ui = {
			icons = {
				server_installed = "✓",
				server_pending = "➜",
				server_uninstalled = "✗",
			},
		},
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

	local function custom_attach(_)
		require("lsp_signature").on_attach({
			bind = true,
			use_lspsaga = false,
			floating_window = true,
			fix_pos = true,
			hint_enable = true,
			hi_parameter = "Search",
			handler_opts = { "double" },
		})
	end

	local function switch_source_header_splitcmd(bufnr, splitcmd)
		bufnr = nvim_lsp.util.validate_bufnr(bufnr)
		local clangd_client = nvim_lsp.util.get_active_client_by_name(bufnr, "clangd")
		local params = { uri = vim.uri_from_bufnr(bufnr) }
		if clangd_client then
			clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
				if err then
					error(tostring(err))
				end
				if not result then
					print("Corresponding file can’t be determined")
					return
				end
				vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
			end)
		else
			print("method textDocument/switchSourceHeader is not supported by any servers active on the current buffer")
		end
	end

	-- Override server settings here

	local enhance_server_opts = {
		["sumneko_lua"] = function(opts)
			opts.settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
					telemetry = { enable = false },
				},
			}
		end,
		["clangd"] = function(opts)
			opts.args = {
				"--background-index",
				"-std=c++20",
				"--pch-storage=memory",
				"--clang-tidy",
				"--suggest-missing-includes",
			}
			opts.capabilities.offsetEncoding = { "utf-16" }
			opts.single_file_support = true
			opts.commands = {
				ClangdSwitchSourceHeader = {
					function()
						switch_source_header_splitcmd(0, "edit")
					end,
					description = "Open source/header in current buffer",
				},
				ClangdSwitchSourceHeaderVSplit = {
					function()
						switch_source_header_splitcmd(0, "vsplit")
					end,
					description = "Open source/header in a new vsplit",
				},
				ClangdSwitchSourceHeaderSplit = {
					function()
						switch_source_header_splitcmd(0, "split")
					end,
					description = "Open source/header in a new split",
				},
			}
			opts.on_attach = function(client)
				custom_attach(client)
			end
		end,
		["jsonls"] = function(opts)
			opts.settings = {
				json = {
					-- Schemas https://www.schemastore.org
					schemas = {
						{
							fileMatch = { "package.json" },
							url = "https://json.schemastore.org/package.json",
						},
						{
							fileMatch = { "tsconfig*.json" },
							url = "https://json.schemastore.org/tsconfig.json",
						},
						{
							fileMatch = {
								".prettierrc",
								".prettierrc.json",
								"prettier.config.json",
							},
							url = "https://json.schemastore.org/prettierrc.json",
						},
						{
							fileMatch = { ".eslintrc", ".eslintrc.json" },
							url = "https://json.schemastore.org/eslintrc.json",
						},
						{
							fileMatch = {
								".babelrc",
								".babelrc.json",
								"babel.config.json",
							},
							url = "https://json.schemastore.org/babelrc.json",
						},
						{
							fileMatch = { "lerna.json" },
							url = "https://json.schemastore.org/lerna.json",
						},
						{
							fileMatch = {
								".stylelintrc",
								".stylelintrc.json",
								"stylelint.config.json",
							},
							url = "http://json.schemastore.org/stylelintrc.json",
						},
						{
							fileMatch = { "/.github/workflows/*" },
							url = "https://json.schemastore.org/github-workflow.json",
						},
					},
				},
			}
		end,
		["tsserver"] = function(opts)
			opts.on_attach = function(client)
				custom_attach(client)
			end
		end,
		["dockerls"] = function(opts)
			opts.on_attach = function(client)
				custom_attach(client)
			end
		end,
		["gopls"] = function(opts)
			local util = require "lspconfig/util"
			opts.cmd = {"gopls", "serve"}
			opts.root_dir = util.root_pattern("go.work", "go.mod", ".git")
			opts.settings = {
				gopls = {
					usePlaceholders = false,
					analyses = {
						nilness = true,
						shadow = true,
						unusedparams = true,
						unusewrites = true,
					},
				},
			}
			opts.on_attach = function(client)
				custom_attach(client)
			end
		end,
	}

	lsp_installer.on_server_ready(function(server)
		local opts = {
			capabilities = capabilities,
			flags = { debounce_text_changes = 500 },
			on_attach = custom_attach,
		}

		if enhance_server_opts[server.name] then
			enhance_server_opts[server.name](opts)
		end

		server:setup(opts)
	end)

	-- https://github.com/vscode-langservers/vscode-html-languageserver-bin

	nvim_lsp.html.setup({
		cmd = { "html-languageserver", "--stdio" },
		filetypes = { "html" },
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = { css = true, javascript = true },
		},
		settings = {},
		single_file_support = true,
		flags = { debounce_text_changes = 500 },
		capabilities = capabilities,
		on_attach = custom_attach,
	})
end
