local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

local core_map = {
	-- Use <C-a> to jump to the first non-empty character (Like emacs)
	-- Use <C-l> to jump to the last non-empty character
	["n|<C-s>"] = map_cmd("<C-a>"):with_noremap(),
	["n|<C-a>"] = map_cmd("^"):with_noremap(),
	["v|<C-a>"] = map_cmd("^"):with_noremap(),
	["n|<C-l>"] = map_cmd("g_"):with_noremap(),
	["v|<C-l>"] = map_cmd("g_"):with_noremap(),

	-- Use "cy" and "xy" to copy or cut selected content into system clipboard
	["v|cy"] = map_cmd('"+y'),
	["v|cx"] = map_cmd('"+x'),

	-- Windows
	["n|<leader>w/"] = map_cr("vs"):with_noremap():with_silent(),
	["n|<leader>w-"] = map_cr("sv"):with_noremap():with_silent(),
	["n|<leader>w["] = map_cmd(":vertical resize+"):with_noremap(),
	["n|<leader>w]"] = map_cmd(":vertical resize-"):with_noremap(),

	["n|<C-K>"] = map_cr("noh"):with_noremap():with_silent(),

	["n|<leader>bc"] = map_cr("CleanHiddenBuffer"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(core_map)
