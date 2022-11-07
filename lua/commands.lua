local commands = {
	cnoreabbrev = {
		-- In command mode, w is often mistakenly entered as W, so make a mapping
		{ "W", "w" },
		{ "Wq", "wq" },
	},

	let = {},
}

for cmd_name, cmd_contents in pairs(commands) do
	for _, cmd_content in ipairs(cmd_contents) do
		local command = table.concat(cmd_content, " ")
		command = cmd_name .. " " .. command
		vim.api.nvim_command(command)
	end
end
