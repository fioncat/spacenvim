local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
require("keymap.helpers")

local plug_map = {
	-- Plugin: nvim-tree
	["n|<leader>tt"] = map_cr("NvimTreeToggle"):with_noremap():with_silent():with_desc("filetree: Toggle"),

	["n|<leader>ff"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent():with_desc("filetree: Find file"),

	["n|<leader>tr"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent():with_desc("filetree: Refresh"),

	-- Plugin: trouble
	["n|gt"] = map_cr("TroubleToggle"):with_noremap():with_silent():with_desc("lsp: Toggle trouble list"),
	["n|<leader>er"] = map_cr("TroubleToggle lsp_references")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show lsp references"),
	["n|<leader>ed"] = map_cr("TroubleToggle document_diagnostics")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show document diagnostics"),
	["n|<leader>ew"] = map_cr("TroubleToggle workspace_diagnostics")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show workspace diagnostics"),
	["n|<leader>eq"] = map_cr("TroubleToggle quickfix")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show quickfix list"),
	["n|<leader>el"] = map_cr("TroubleToggle loclist"):with_noremap():with_silent():with_desc("lsp: Show loclist"),

	-- Plugin: telescope
	["n|<C-p>"] = map_callback(function()
			_command_panel()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Toggle command panel"),
	["n|<leader>su"] = map_callback(function()
			require("telescope").extensions.undo.undo()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("edit: Show undo history"),
	["n|<leader>sf"] = map_callback(function()
			require("telescope").extensions.frecency.frecency()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: File by frecency"),
	["n|<leader>sr"] = map_callback(function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: Word in project"),
	["n|<leader>so"] = map_cu("Telescope oldfiles"):with_noremap():with_silent():with_desc("find: File by history"),
	["n|<leader>ss"] = map_cu("lua require('telescope.builtin').find_files({hidden=true})")
		:with_noremap()
		:with_silent()
		:with_desc("find: File in project"),
	["n|<leader>st"] = map_cu("Telescope colorscheme"):with_noremap():with_silent():with_desc("find: Find colorscheme"),
	["n|<leader>sn"] = map_cu(":enew"):with_noremap():with_silent():with_desc("buffer: New"),
	["n|<leader>sg"] = map_cu("Telescope git_files")
		:with_noremap()
		:with_silent()
		:with_desc("find: file in git project"),
	["n|<leader>sb"] = map_cu("Telescope buffers"):with_noremap():with_silent():with_desc("find: Buffer opened"),
	["n|<leader>sw"] = map_cu("Telescope grep_string"):with_noremap():with_silent():with_desc("find: Current word"),
	["n|<leader>sd"] = map_cr("Telescope lsp_document_symbols")
		:with_noremap()
		:with_silent()
		:with_desc("find: lsp symbols"),
	["n|<leader>sl"] = map_cr("Telescope lsp_dynamic_workspace_symbols")
		:with_noremap()
		:with_silent()
		:with_desc("find: lsp symbols in workspace"),

	-- Terminal
	["t|<C-]>"] = map_cmd([[<C-\><C-n>]]):with_silent():with_desc("terminal: switch to normal mode"),
	['n|<leader>"'] = map_cr("ToggleTerm direction=horizontal")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: trigger horizontal"),
	["n|<leader>'"] = map_cr("ToggleTerm direction=vertical")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: trigger vertical"),
	["t|<C-Q>"] = map_cmd("exit<CR>"):with_noremap():with_silent():with_desc("terminal: quit"),

	-- lazygit
	["n|<leader>gg"] = map_callback(function()
			_toggle_lazygit()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("git: trigger git TUI"),
}

bind.nvim_load_mapping(plug_map)
