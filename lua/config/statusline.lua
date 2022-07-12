return function()
	local gps = require("nvim-gps")

	local function gps_content()
		if gps.is_available() then
			return gps.get_location()
		else
			return ""
		end
	end
	local simple_sections = {
		lualine_a = { "mode" },
		lualine_b = { "filetype" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	}
	local symbols_outline = {
		sections = simple_sections,
		filetypes = { "Outline" },
	}
	local dapui_scopes = {
		sections = simple_sections,
		filetypes = { "dapui_scopes" },
	}

	local dapui_breakpoints = {
		sections = simple_sections,
		filetypes = { "dapui_breakpoints" },
	}

	local dapui_stacks = {
		sections = simple_sections,
		filetypes = { "dapui_stacks" },
	}

	local dapui_watches = {
		sections = simple_sections,
		filetypes = { "dapui_watches" },
	}

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "catppuccin",
			disabled_filetypes = {},
			component_separators = { left = '', right = ''},
    		section_separators = { left = '', right = ''},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { { "branch" }, { "diff" } },
			lualine_c = {
				{ "lsp_progress" },
				{ gps_content, cond = gps.is_available },
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " " },
				},
			},
			lualine_y = {
				{
					"filetype",
					"encoding",
				},
				{
					"fileformat",
					icons_enabled = true,
					symbols = {
						unix = "LF",
						dos = "CRLF",
						mac = "CR",
					},
				},
			},
			lualine_z = { "progress", "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {
			"quickfix",
			"nvim-tree",
			"toggleterm",
			"fugitive",
			symbols_outline,
			dapui_scopes,
			dapui_breakpoints,
			dapui_stacks,
			dapui_watches,
		},
	})
end
