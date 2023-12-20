local bind = require("keymap.bind")
local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
-- local map_callback = bind.map_callback

local timestamp_cmd
if require("core.global").is_mac then
	timestamp_cmd = [[!read timestamp && date -r "$timestamp" +'\%Y-\%m-\%d \%H:\%M:\%S']]
else
	timestamp_cmd = [[!read timestamp && date -d "@$timestamp" +'\%Y-\%m-\%d \%H:\%M:\%S']]
end

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

	["n|XX"] = map_cr("quitall!"):with_noremap():with_silent(),

	-- View diff for two files(buffers)
	["n|wd"] = map_cr("windo diffthis"):with_noremap():with_silent(),

	-- Format JSON string
	["v|<leader>jq"] = map_cr("!jq"):with_noremap():with_silent(),

	-- Encode/Decode base64 string
	["v|<leader>bd"] = map_cr("!base64 -d"):with_noremap():with_silent(),
	["v|<leader>be"] = map_cr("!base64"):with_noremap():with_silent(),

	-- Convert timestamp to human-readable datetime
	["v|<leader>ts"] = map_cr(timestamp_cmd):with_noremap():with_silent(),
}

bind.nvim_load_mapping(core_map)
