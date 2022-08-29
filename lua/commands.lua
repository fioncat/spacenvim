local commands = {
	cnoreabbrev = {
		-- In command mode, w is often mistakenly entered as W, so make a mapping
		{"W", "w"},
		{"Wq", "wq"},
	},

	let = {
		-- Git blamer. If no added here, will not work?
		{"g:blamer_date_format = '%y-%m-%d'"},
		{"g:blamer_show_in_visual_modes = 0"},
		{"g:blamer_show_in_insert_modes = 0"},
	},
}

for cmd_name, cmd_contents in pairs(commands) do
	for _, cmd_content in ipairs(cmd_contents) do
		local command = table.concat(cmd_content, " ")
		command = cmd_name .. " " .. command
		vim.api.nvim_command(command)
	end
end
