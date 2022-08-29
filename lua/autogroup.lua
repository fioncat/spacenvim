local autogroup_definitions = {
	bufs = {
		-- auto place to last edit
		{
			"BufReadPost",
			"*",
			[[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif]],
		},
		-- auto close NvimTree
		{
			"BufEnter",
			"*",
			[[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]],
		},
	},
	wins = {
		-- Highlight current line only on focused window
		{
			"WinEnter,BufEnter,InsertLeave",
			"*",
			[[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]],
		},
		{
			"WinLeave,BufLeave,InsertEnter",
			"*",
			[[if &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal nocursorline | endif]],
		},
		-- Equalize window dimensions when resizing vim window
		{ "VimResized", "*", [[tabdo wincmd =]] },
	},

	ft = {
		{ "FileType", "alpha", "set showtabline=0" },

		{ "FileType", "json", "setlocal setlocal tabstop=2" },
		{ "FileType", "json", "setlocal shiftwidth=2" },
		{ "FileType", "json", "setlocal expandtab" },

		{ "FileType", "yaml", "setlocal setlocal tabstop=2" },
		{ "FileType", "yaml", "setlocal shiftwidth=2" },
		{ "FileType", "yaml", "setlocal expandtab" },
	},
}

for group_name, definition in pairs(autogroup_definitions) do
	vim.api.nvim_command("augroup " .. group_name)
	vim.api.nvim_command("autocmd!")
	for _, def in ipairs(definition) do
		local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
		vim.api.nvim_command(command)
	end
	vim.api.nvim_command("augroup END")
end
