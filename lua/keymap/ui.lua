local bind = require("keymap.bind")
local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
-- local map_callback = bind.map_callback

local plug_map = {
	-- Plugin: bufferline
	["n|<leader>bb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
	["n|<leader>bd"] = map_cr("BufferLinePickClose"):with_noremap():with_silent(),
	-- ["n|<leader>bn"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
	-- ["n|<leader>bp"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)
