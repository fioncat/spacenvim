return function()
	require("nvim-tree").setup({
		diagnostics = {
			enable = false,
			icons = { hint = "", info = "", warning = "", error = "" },
		},
		update_focused_file = {
			enable = false,
			update_cwd = false,
			ignore_list = {},
		},
		filters = { dotfiles = false, custom = {} },
		git = { enable = true, ignore = false, timeout = 500 },
		view = {
			hide_root_folder = false,
			side = "left",
			mappings = { custom_only = false, list = {} },
			number = false,
			relativenumber = false,
			signcolumn = "yes",
			width = 40,
			-- adaptive_size = true,
		},
		trash = { cmd = "trash", require_confirm = true },
		renderer = {
			highlight_opened_files = "all"
		}
	})
	-- Auto close nvimtree when it is the last window.
	vim.api.nvim_create_autocmd('BufEnter', {
		command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    	nested = true,
	})
end
