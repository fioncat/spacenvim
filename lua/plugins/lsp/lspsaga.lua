return function()
	local icons = {
		diagnostics = require("icons").get("diagnostics", true),
		kind = require("icons").get("kind", true),
		type = require("icons").get("type", true),
		ui = require("icons").get("ui", true),
	}

	local function set_sidebar_icons()
		-- Set icons for sidebar.
		local diagnostic_icons = {
			Error = icons.diagnostics.Error_alt,
			Warn = icons.diagnostics.Warning_alt,
			Info = icons.diagnostics.Information_alt,
			Hint = icons.diagnostics.Hint_alt,
		}
		for type, icon in pairs(diagnostic_icons) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl })
		end
	end

	local function get_palette()
		if vim.g.colors_name == "catppuccin" then
			-- If the colorscheme is catppuccin then use the palette.
			return require("catppuccin.palettes").get_palette()
		else
			-- Default behavior: return lspsaga's default palette.
			local palette = require("lspsaga.lspkind").colors
			palette.peach = palette.orange
			palette.flamingo = palette.orange
			palette.rosewater = palette.yellow
			palette.mauve = palette.violet
			palette.sapphire = palette.blue
			palette.maroon = palette.orange

			return palette
		end
	end

	set_sidebar_icons()

	local colors = get_palette()

	require("lspsaga").init_lsp_saga({
		diagnostic_header = {
			icons.diagnostics.Error_alt,
			icons.diagnostics.Warning_alt,
			icons.diagnostics.Information_alt,
			icons.diagnostics.Hint_alt,
		},
		code_action_icon = "",
		custom_kind = {
			-- Kind
			Class = { icons.kind.Class, colors.yellow },
			Constant = { icons.kind.Constant, colors.peach },
			Constructor = { icons.kind.Constructor, colors.sapphire },
			Enum = { icons.kind.Enum, colors.yellow },
			EnumMember = { icons.kind.EnumMember, colors.teal },
			Event = { icons.kind.Event, colors.yellow },
			Field = { icons.kind.Field, colors.teal },
			File = { icons.kind.File, colors.rosewater },
			Function = { icons.kind.Function, colors.blue },
			Interface = { icons.kind.Interface, colors.yellow },
			Key = { icons.kind.Keyword, colors.red },
			Method = { icons.kind.Method, colors.blue },
			Module = { icons.kind.Module, colors.blue },
			Namespace = { icons.kind.Namespace, colors.blue },
			Number = { icons.kind.Number, colors.peach },
			Operator = { icons.kind.Operator, colors.sky },
			Package = { icons.kind.Package, colors.blue },
			Property = { icons.kind.Property, colors.teal },
			Struct = { icons.kind.Struct, colors.yellow },
			TypeParameter = { icons.kind.TypeParameter, colors.maroon },
			Variable = { icons.kind.Variable, colors.peach },
			-- Type
			Array = { icons.type.Array, colors.peach },
			Boolean = { icons.type.Boolean, colors.peach },
			Null = { icons.type.Null, colors.yellow },
			Object = { icons.type.Object, colors.yellow },
			String = { icons.type.String, colors.green },
			-- ccls-specific iconss.
			TypeAlias = { icons.kind.TypeAlias, colors.green },
			Parameter = { icons.kind.Parameter, colors.blue },
			StaticMethod = { icons.kind.StaticMethod, colors.peach },
		},
	})

	vim.cmd([[highlight LspFloatWinNormal guifg='None' guibg='None']])
end
