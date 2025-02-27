local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local plug_map = {
	-- LSP
	["n|gd"] = map_cr("Glance definitions"):with_noremap():with_silent():with_desc("lsp: jump to definitions"),
	["n|gr"] = map_cr("Glance references"):with_noremap():with_silent():with_desc("lsp: jump to references"),
	["n|gi"] = map_cr("Glance implementations"):with_noremap():with_silent():with_desc("lsp: jump to implementations"),
	["n|gt"] = map_cr("Glance lsp_type_definitions")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: jump to type definitions"),
	["n|gh"] = map_cr("Lspsaga lsp_finder"):with_noremap():with_silent():with_desc("lsp: launch finder"),
	["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent():with_desc("lsp: display hover document"),
	["n|<leader>en"] = map_cr("Lspsaga diagnostic_jump_next")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: jump to next error"),
	["n|<leader>ep"] = map_cr("Lspsaga diagnostic_jump_prev")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: jump to previous error"),
	["n|<leader>se"] = map_cr("Telescope diagnostics")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: search diagnostics"),
	["n|<leader>ee"] = map_cr("TroubleToggle workspace_diagnostics")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: search workspace diagnostics"),
	["n|<leader>ca"] = map_cr("Lspsaga code_action")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: trigger code action for current line"),
	["v|<leader>ca"] = map_cu("Lspsaga range_code_action")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: trigger code action for multiple lines"),
	["n|<leader>cr"] = map_cr("Lspsaga rename"):with_noremap():with_silent():with_desc("lsp: rename for current word"),
}

bind.nvim_load_mapping(plug_map)
