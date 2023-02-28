local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local plug_map = {
	-- LSP
	["n|gd"] = map_cr("Telescope lsp_definitions"):with_noremap():with_silent(),
	["n|gr"] = map_cr("Telescope lsp_references"):with_noremap():with_silent(),
	["n|gi"] = map_cr("Telescope lsp_implementations"):with_noremap():with_silent(),
	["n|gt"] = map_cr("Telescope lsp_type_definitions"):with_noremap():with_silent(),
	["n|gh"] = map_cr("Lspsaga lsp_finder"):with_noremap():with_silent(),
	["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
	["n|<leader>en"] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
	["n|<leader>ep"] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
	["n|<leader>se"] = map_cr("Telescope diagnostics"):with_noremap():with_silent(),
	["n|<leader>ee"] = map_cr("TroubleToggle workspace_diagnostics"):with_noremap():with_silent(),
	["n|<leader>ca"] = map_cr("Lspsaga code_action"):with_noremap():with_silent(),
	["v|<leader>ca"] = map_cu("Lspsaga range_code_action"):with_noremap():with_silent(),
	["n|<leader>cr"] = map_cr("Lspsaga rename"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)
