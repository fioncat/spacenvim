local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local timestamp_cmd
if require("core.global").is_mac then
	timestamp_cmd = [[!read timestamp && date -r "$timestamp" +'\%Y-\%m-\%d \%H:\%M:\%S']]
else
	timestamp_cmd = [[!read timestamp && date -d "@$timestamp" +'\%Y-\%m-\%d \%H:\%M:\%S']]
end

local mappings = {
	core = {
		-- Use <C-a> to jump to the first non-empty character (Like emacs)
		-- Use <C-l> to jump to the last non-empty character
		["n|<C-s>"] = map_cmd("<C-a>"):with_noremap():with_desc("edit: jump to first char"),
		["n|<C-a>"] = map_cmd("^"):with_noremap():with_desc("edit: jump to the first character of the line"),
		["v|<C-a>"] = map_cmd("^"):with_noremap():with_desc("edit: jump to the first character of the line"),
		["n|<C-l>"] = map_cmd("g_"):with_noremap():with_desc("edit: jump to the last character of the line"),
		["v|<C-l>"] = map_cmd("g_"):with_noremap():with_desc("edit: jump to the last character of the line"),

		-- Use "cy" and "xy" to copy or cut selected content into system clipboard
		["v|cy"] = map_cmd('"+y'),
		["v|cx"] = map_cmd('"+x'),

		-- Windows
		["n|<leader>w/"] = map_cr("vs"):with_noremap():with_silent():with_desc("windows: split vertical"),
		["n|<leader>w-"] = map_cr("sv"):with_noremap():with_silent():with_desc("windows: split horizontal"),
		["n|<leader>w["] = map_cmd(":vertical resize+"):with_noremap():with_desc("windows: resize +"),
		["n|<leader>w]"] = map_cmd(":vertical resize-"):with_noremap():with_desc("windows: resize -"),

		["n|<C-K>"] = map_cr("noh"):with_noremap():with_silent():with_desc("ui: disable search highlight"),

		["n|<leader>bc"] = map_cr("CleanHiddenBuffer")
			:with_noremap()
			:with_silent()
			:with_desc("buffer: delete all unused buffers"),

		["n|XX"] = map_cr("quitall!"):with_noremap():with_silent():with_desc("editor: force QUIT editor"),

		-- View diff for two files(buffers)
		["n|<leader>wd"] = map_cr("windo diffthis")
			:with_noremap()
			:with_silent()
			:with_desc("tool: view diff for two windows"),

		-- Format JSON string
		["v|<leader>jq"] = map_cr("!jq"):with_noremap():with_silent():with_desc("tool: format selected json"),

		-- Encode/Decode base64 string
		["v|<leader>bd"] = map_cr("!base64 -d"):with_noremap():with_silent():with_desc("tool: decode selected base64"),
		["v|<leader>be"] = map_cr("!base64")
			:with_noremap()
			:with_silent()
			:with_desc("tool: encode selected text to base64"),

		-- Convert timestamp to human-readable datetime
		["v|<leader>ts"] = map_cr(timestamp_cmd)
			:with_noremap()
			:with_silent()
			:with_desc("tool: format selected timestamp"),
		-- Package manager: lazy.nvim
		["n|<leader>ph"] = map_cr("Lazy"):with_silent():with_noremap():with_nowait():with_desc("package: Show"),
		["n|<leader>ps"] = map_cr("Lazy sync"):with_silent():with_noremap():with_nowait():with_desc("package: Sync"),
		["n|<leader>pu"] = map_cr("Lazy update")
			:with_silent()
			:with_noremap()
			:with_nowait()
			:with_desc("package: Update"),
		["n|<leader>pi"] = map_cr("Lazy install")
			:with_silent()
			:with_noremap()
			:with_nowait()
			:with_desc("package: Install"),
		["n|<leader>pl"] = map_cr("Lazy log"):with_silent():with_noremap():with_nowait():with_desc("package: Log"),
		["n|<leader>pc"] = map_cr("Lazy check"):with_silent():with_noremap():with_nowait():with_desc("package: Check"),
		["n|<leader>pd"] = map_cr("Lazy debug"):with_silent():with_noremap():with_nowait():with_desc("package: Debug"),
		["n|<leader>pp"] = map_cr("Lazy profile")
			:with_silent()
			:with_noremap()
			:with_nowait()
			:with_desc("package: Profile"),
		["n|<leader>pr"] = map_cr("Lazy restore")
			:with_silent()
			:with_noremap()
			:with_nowait()
			:with_desc("package: Restore"),
		["n|<leader>px"] = map_cr("Lazy clean"):with_silent():with_noremap():with_nowait():with_desc("package: Clean"),
	},
}

bind.nvim_load_mapping(mappings.core)

-- Builtin & Plugin keymaps
require("keymap.completion")
require("keymap.editor")
require("keymap.lang")
require("keymap.tool")
require("keymap.ui")

-- User keymaps
local ok, def = pcall(require, "user.keymap.init")
if ok then
	require("modules.utils.keymap").replace(def)
end
