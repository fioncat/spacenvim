local bind = require("keymap.bind")
local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
-- local map_callback = bind.map_callback

local plug_map = {
	-- Plugin: bufferline
	["n|<leader>jb"] = map_cr("BufferLinePick"):with_noremap():with_silent():with_desc("bufferline: pick buffer"),
	["n|<leader>bd"] = map_cr("BufferLinePickClose")
		:with_noremap()
		:with_silent()
		:with_desc("bufferline: close current buffer"),

	["n|<leader>bn"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent():with_desc("bufferline: cycle next"),
	["n|<leader>1"] = map_cr([[lua require("bufferline").go_to(1, true)]])
		:with_noremap()
		:with_silent()
		:with_desc("bufferline: go to buffer 1"),
	["n|<leader>2"] = map_cr([[lua require("bufferline").go_to(2, true)]])
		:with_noremap()
		:with_silent()
		:with_desc("bufferline: go to buffer 2"),
	["n|<leader>3"] = map_cr([[lua require("bufferline").go_to(3, true)]])
		:with_noremap()
		:with_silent()
		:with_desc("bufferline: go to buffer 3"),
	["n|<leader>4"] = map_cr([[lua require("bufferline").go_to(4, true)]])
		:with_noremap()
		:with_silent()
		:with_desc("bufferline: go to buffer 4"),
	["n|<leader>5"] = map_cr([[lua require("bufferline").go_to(5, true)]])
		:with_noremap()
		:with_silent()
		:with_desc("bufferline: go to buffer 5"),
	["n|<leader>6"] = map_cr([[lua require("bufferline").go_to(6, true)]])
		:with_noremap()
		:with_silent()
		:with_desc("bufferline: go to buffer 5"),
	["n|<leader>7"] = map_cr([[lua require("bufferline").go_to(7, true)]])
		:with_noremap()
		:with_silent()
		:with_desc("bufferline: go to buffer 7"),
	["n|<leader>8"] = map_cr([[lua require("bufferline").go_to(8, true)]])
		:with_noremap()
		:with_silent()
		:with_desc("bufferline: go to buffer 8"),
	["n|<leader>9"] = map_cr([[lua require("bufferline").go_to(9, true)]])
		:with_noremap()
		:with_silent()
		:with_desc("bufferline: go to buffer 9"),

	["n|<leader>bp"] = map_cr("BufferLineCyclePrev")
		:with_noremap()
		:with_silent()
		:with_desc("bufferline: cycle previous"),
}

bind.nvim_load_mapping(plug_map)
