local packer = require('packer')

-- Enabled plugin sets. A plugin set contains multiple plugins that have the same type of functionality
-- or need to cooperate with each other.
-- If you don't want to use a plugin set, you can delete it here.
local plugin_set = {
	-- Basic plugins, not recommended to delete
	"common",

	-- Searching
	"telescope",

	-- Syntax highlight
	"treesitter",

	-- Completion
	"cmp",

	-- LSP support
	"lsp",

	-- Language support
	"lang",
}

return packer.startup(function()
	-- Init packer plugin manager.
	packer.init({
		git = { clone_timeout = 60, default_url_format = "git@github.com:%s" },
		disable_commands = true,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	})

	local all_plugins = {}

	local add_plugins = function (mod)
		mod = 'plugins.' .. mod
		local plugins = require(mod)
		for k, v in pairs(plugins) do
			all_plugins[k] = v
		end
	end

	for _, set_name in ipairs(plugin_set) do
		add_plugins(set_name)
	end

	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim"
	use { "nvim-lua/popup.nvim", opt = true }

	for name, conf in pairs(all_plugins) do
		use(vim.tbl_extend("force", { name }, conf))
	end

end)
