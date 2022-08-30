local autogroup_definitions = {
	bufs = {},

	ft = {
		{ "FileType", "alpha", "set showtabline=0" },

		{ "FileType", "json", "setlocal tabstop=2" },
		{ "FileType", "json", "setlocal shiftwidth=2" },
		{ "FileType", "json", "setlocal expandtab" },

		{ "FileType", "yaml", "setlocal tabstop=2" },
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
