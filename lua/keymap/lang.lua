local bind = require("keymap.bind")
local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
-- local map_callback = bind.map_callback

local plug_map = {
	-- Golang tool
	["n|gat"] = map_cmd(":GoAddTags "):with_noremap(),
	["n|grt"] = map_cmd(":GoRemoveTags "):with_noremap(),
	["n|gct"] = map_cr("GoCleanTags"):with_noremap(),
	["n|gie"] = map_cr("GoIferr"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)
