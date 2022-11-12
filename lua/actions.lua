local exec_gomodifytags = function(action, tag, camel)
	local filename = vim.api.nvim_buf_get_name(0)
	local linenr = vim.api.nvim_win_get_cursor(0)[1]
	local offset = vim.fn.line2byte(linenr)
	local cmd = {
		"gomodifytags",
		"-file",
		filename,
		"-offset",
		offset,
		"--skip-unexported",
	}
	if action == "add" then
		table.insert(cmd, "-add-tags")
		table.insert(cmd, tag)
		if camel == true then
			table.insert(cmd, "-transform")
			table.insert(cmd, "camelcase")
		end
	elseif action == "remove" then
		table.insert(cmd, "-remove-tags")
		table.insert(cmd, tag)
	else
		table.insert(cmd, "-clear-tags")
	end
	local cmd = table.concat(cmd, " ")

	local out = vim.fn.system(cmd)
	local ret_code = vim.api.nvim_exec("echo v:shell_error", true)
	if ret_code ~= "0" then
		vim.notify(out, "error")
		return
	end

	local lines = vim.split(out, "\n")
	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
	vim.api.nvim_exec("FormatWrite", false)
end

vim.api.nvim_create_user_command("GoModifyTagsAdd", function(opts)
	local args = vim.split(opts.args, " ")
	local tag = args[1]
	local camel = false
	if args[2] then
		camel = true
	end
	exec_gomodifytags("add", tag, camel)
end, { nargs = 1 })

vim.api.nvim_create_user_command("GoModifyTagsRemove", function(opts)
	exec_gomodifytags("remove", opts.args, false)
end, { nargs = 1 })

vim.api.nvim_create_user_command("GoModifyTagsClear", function(opts)
	exec_gomodifytags("clear", "", false)
end, {})

vim.api.nvim_create_user_command("ClearHiddenBuffer", function(opts)
	local non_hidden_buffer = {}
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		non_hidden_buffer[buf] = true
	end

	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		local modified = vim.fn.getbufvar(buf, "&modified")
		-- we won't delete modified buffer
		if modified ~= 1 and non_hidden_buffer[buf] == nil then
			vim.api.nvim_buf_delete(buf, {
				force = false,
			})
		end
	end
	-- Force bufferline to reload
	vim.api.nvim_exec("BufferLineSortByTabs", false)
end, {})
