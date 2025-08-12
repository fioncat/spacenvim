local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local mappings = {
	builtins = {},

	plugins = {
		-- Plugin: bufferline
		["n|<leader>jb"] = map_cr("BufferLinePick"):with_noremap():with_silent():with_desc("bufferline: pick buffer"),
		["n|<leader>bd"] = map_cr("BufferLinePickClose")
			:with_noremap()
			:with_silent()
			:with_desc("bufferline: close current buffer"),

		["n|<leader>bn"] = map_cr("BufferLineCycleNext")
			:with_noremap()
			:with_silent()
			:with_desc("bufferline: cycle next"),
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
	},
}

bind.nvim_load_mapping(mappings.builtins)
bind.nvim_load_mapping(mappings.plugins)

--- The following code enables this file to be exported ---
---  for use with gitsigns lazy-loaded keymap bindings  ---

local M = {}

function M.gitsigns(bufnr)
	local gitsigns = require("gitsigns")
	local map = {
		["n|]g"] = map_callback(function()
				if vim.wo.diff then
					return "]g"
				end
				vim.schedule(function()
					gitsigns.nav_hunk("next")
				end)
				return "<Ignore>"
			end)
			:with_buffer(bufnr)
			:with_noremap()
			:with_expr()
			:with_desc("git: Goto next hunk"),
		["n|[g"] = map_callback(function()
				if vim.wo.diff then
					return "[g"
				end
				vim.schedule(function()
					gitsigns.nav_hunk("prev")
				end)
				return "<Ignore>"
			end)
			:with_buffer(bufnr)
			:with_noremap()
			:with_expr()
			:with_desc("git: Goto prev hunk"),
		["n|<leader>gs"] = map_callback(function()
				gitsigns.stage_hunk()
			end)
			:with_buffer(bufnr)
			:with_noremap()
			:with_desc("git: Toggle staging/unstaging of hunk"),
		["v|<leader>gs"] = map_callback(function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			:with_buffer(bufnr)
			:with_noremap()
			:with_desc("git: Toggle staging/unstaging of selected hunk"),
		["n|<leader>gr"] = map_callback(function()
				gitsigns.reset_hunk()
			end)
			:with_buffer(bufnr)
			:with_noremap()
			:with_desc("git: Reset hunk"),
		["v|<leader>gr"] = map_callback(function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			:with_buffer(bufnr)
			:with_noremap()
			:with_desc("git: Reset hunk"),
		["n|<leader>gR"] = map_callback(function()
				gitsigns.reset_buffer()
			end)
			:with_buffer(bufnr)
			:with_noremap()
			:with_desc("git: Reset buffer"),
		["n|<leader>gp"] = map_callback(function()
				gitsigns.preview_hunk()
			end)
			:with_buffer(bufnr)
			:with_noremap()
			:with_desc("git: Preview hunk"),
		["n|<leader>gb"] = map_callback(function()
				gitsigns.blame_line({ full = true })
			end)
			:with_buffer(bufnr)
			:with_noremap()
			:with_desc("git: Blame line"),
		-- Text objects
		["ox|ih"] = map_callback(function()
				gitsigns.select_hunk()
			end)
			:with_buffer(bufnr)
			:with_noremap(),
	}
	bind.nvim_load_mapping(map)
end

return M
