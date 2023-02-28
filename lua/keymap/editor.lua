local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
-- local map_callback = bind.map_callback
-- local et = bind.escape_termcode

local plug_map = {
	-- Plugin: nvim-bufdel
	["n|<A-q>"] = map_cr("BufDel"):with_noremap():with_silent():with_desc("buffer: Close current"),

	-- Plugin: nvim_comment
	["n|<leader>cc"] = map_cr("CommentToggle"):with_noremap():with_silent():with_desc("Toggle comment"),
	["v|<leader>cc"] = map_cr("CommentToggle"):with_silent():with_desc("Toggle comment"),

	-- Plugin: diffview
	["n|<leader>dv"] = map_cr("DiffviewOpen"):with_silent():with_noremap():with_desc("git: Show diff"),
	["n|<leader>dq"] = map_cr("DiffviewClose"):with_silent():with_noremap():with_desc("git: Close diff"),

	-- Plugin: hop
	["n|<leader>jw"] = map_cu("HopWord"):with_noremap():with_desc("jump: Goto word"),
	["n|<leader>jj"] = map_cu("HopLine"):with_noremap():with_desc("jump: Goto line"),
}

bind.nvim_load_mapping(plug_map)
