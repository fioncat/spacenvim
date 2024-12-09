local bind = require("keymap.bind")
local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local plug_map = {
	-- Golang tool
	["n|gat"] = map_cmd(":GoAddTags "):with_noremap():with_desc("golang: add tags"),
	["n|grt"] = map_cmd(":GoRemoveTags "):with_noremap():with_desc("golang: remove tags"),
	["n|gct"] = map_cr("GoCleanTags"):with_noremap():with_desc("golang: clean tags"),
	["n|gie"] = map_cr("GoIferr"):with_noremap():with_silent():with_desc("golang: add if-err code block"),
}

bind.nvim_load_mapping(plug_map)
