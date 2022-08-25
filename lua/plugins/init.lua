local packer = require('packer')

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

	add_plugins("common")
	add_plugins("telescope")
	add_plugins("treesitter")
	add_plugins("cmp")
	add_plugins("lsp")
	add_plugins("lang")

	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim"
	use { "nvim-lua/popup.nvim", opt = true }

	for name, conf in pairs(all_plugins) do
		use(vim.tbl_extend("force", { name }, conf))
	end

end)
