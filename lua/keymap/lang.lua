local bind = require("keymap.bind")
local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local plug_map = {
	-- Golang tool
	["n|gat"] = map_cmd(":GoAddTags "):with_noremap(),
	["n|grt"] = map_cmd(":GoRemoveTags "):with_noremap(),
	["n|gct"] = map_cr("GoCleanTags"):with_noremap(),
	["n|gie"] = map_cr("GoIferr"):with_noremap():with_silent(),

	["n|<leader>cs"] = map_callback(function()
			require("crates").show_popup()
		end)
		:with_noremap()
		:with_silent()
		:with_buffer(0)
		:with_desc("crates: Toggle pop-up window"),
	["n|<leader>cU"] = map_callback(function()
			require("crates").upgrade_crate()
		end)
		:with_noremap()
		:with_silent()
		:with_buffer(0)
		:with_desc("crates: Upgrade current crate"),
	["v|<leader>cU"] = map_callback(function()
			require("crates").upgrade_crates()
		end)
		:with_noremap()
		:with_silent()
		:with_buffer(0)
		:with_desc("crates: Upgrade selected crates"),
	["n|<leader>cA"] = map_callback(function()
			require("crates").upgrade_all_crates()
		end)
		:with_noremap()
		:with_silent()
		:with_buffer(0)
		:with_desc("crates: Upgrade all crates"),

	["n|<leader>cH"] = map_callback(function()
			require("crates").open_homepage()
		end)
		:with_noremap()
		:with_silent()
		:with_buffer(0)
		:with_desc("crates: Open current crate's homepage"),
	["n|<leader>cR"] = map_callback(function()
			require("crates").open_repository()
		end)
		:with_noremap()
		:with_silent()
		:with_buffer(0)
		:with_desc("crates: Open current crate's repository"),
	["n|<leader>cD"] = map_callback(function()
			require("crates").open_documentation()
		end)
		:with_noremap()
		:with_silent()
		:with_buffer(0)
		:with_desc("crates: Open current crate's documentation"),
	["n|<leader>cC"] = map_callback(function()
			require("crates").open_crates_io()
		end)
		:with_noremap()
		:with_silent()
		:with_buffer(0)
		:with_desc("crates: Browse current crate on crates.io"),
}

bind.nvim_load_mapping(plug_map)
