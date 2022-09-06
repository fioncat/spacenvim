return function()
	-- Set icons for sidebar.
	local diagnostic_icons = {
		Error = " ",
		Warn = " ",
		Info = " ",
		Hint = " ",
	}
	for type, icon in pairs(diagnostic_icons) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl })
	end

	local kind = require("lspsaga.lspkind")
	kind[2][2] = " "
	kind[4][2] = " "
	kind[5][2] = "ﴯ "
	kind[6][2] = " "
	kind[7][2] = "ﰠ "
	kind[8][2] = " "
	kind[9][2] = " "
	kind[10][2] = " "
	kind[11][2] = " "
	kind[12][2] = " "
	kind[13][2] = " "
	kind[15][2] = " "
	kind[16][2] = " "
	kind[23][2] = " "
	kind[26][2] = " "

	local saga = require("lspsaga")
	saga.init_lsp_saga({
		diagnostic_header = { " ", " ", "  ", " " },
		code_action_icon = "",
	})
	vim.cmd([[highlight LspFloatWinNormal guifg='None' guibg='None']])
end
