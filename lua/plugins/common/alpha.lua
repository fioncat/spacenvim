return function()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = {
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠤⠒⠊⠉⠀⢀⠴⠊⠉⠋⠙⢿⡖⠦⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠊⠁⠀⠀⠀⠀⡠⠚⠁⠀⠀⠀⠀⠀⠀⠹⡄⠀⠈⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⠀⠀⠀⠈⢳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⠀⠀⢀⣾⠶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⢻⣆⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⠠⡇⠀⠀⠀⢀⣴⢿⠁⠀⠈⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡇⠀⠀⠀⠀⢸⣿⠀⢀⡴⠋⢣⠀⠀⠀⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⢾⣧⣘⡀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠀⢸⣿⠖⠁⠀⠀⠀⢣⠀⠀⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⢀⣇⠀⠀⠀⠀⠈⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⣼⡇⠀⠀⠀⠀⠀⠀⢣⠀⠀⠀ ]],
		[[⠀⠀⠀⣀⣤⣶⠟⠋⠓⠦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣶⣿⠤⠖⠚⠉⠙⡆⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀ ]],
		[[⠀⢠⣾⣟⠁⠃⠀⠀⠀⠀⠀⠈⠉⠉⠓⠒⠒⠒⠒⠒⠒⠒⣶⡶⢿⠉⠉⠀⠈⢆⠀⠀⠀⠀⢳⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀ ]],
		[[⠀⠀⠙⣿⢿⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣴⡖⣻⡟⠀⢸⠀⠀⠀⠀⠈⡆⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⣨⠇ ]],
		[[⠀⠀⠀⢹⡀⠀⠉⠉⡿⠲⣶⠒⠒⠒⣿⡏⠉⠁⠀⠀⠉⢉⡴⠒⢺⠀⠀⠀⠀⠀⢹⠀⠀⠀⣼⡇⠀⠀⠀⠀⠀⠀⣬⠃⠀ ]],
		[[⠀⠀⠀⠀⠳⡀⠀⠀⢧⠀⡾⠀⠀⣀⣠⡀⠀⠀⠀⠀⠀⠸⣦⣀⣸⡇⠀⠀⠀⠀⠈⡆⠀⣰⣿⡇⠀⠀⠀⠀⢀⡴⠁⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠱⡀⠀⠈⢯⡀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠉⠛⠛⢳⠀⠀⠀⠀⠀⣷⣴⣿⣿⡇⠀⠀⠀⢀⡟⠁⠀⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⣱⡀⠀⠀⠑⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⣿⠛⠿⣿⡇⠀⠀⢠⡟⠀⠀⠀⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⣿⣿⢦⡀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⣹⠀⠀⠈⠁⠀⢠⠎⠀⠀⠀⠀⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⠉⠁⠀⢙⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡀⠀⠀⠀⣰⠋⠀⠀⠀⠀⠀⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡟⢦⡀⠈⢣⠀⠀⠀⠀⠀⠀⠀⠀ ]],
		[[⠀⣀⡀⠀⠀⣀⠤⠒⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⣴⣿⣷⠾⠃⠀⠀⠀⠀⠀⠀⠀ ]],
		[[⡼⠟⠳⣀⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠟⠋⢁⣀⡀⢀⣀⡀⠀⠀⠀⠀ ]],
		[[⡇⠀⡀⠱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠿⠟⠳⡀⠀⠀⠀⠀⠀⠀⢸⣤⡞⠉⠀⠀⠰⡟⠙⠳⣄⠀⠀ ]],
		[[⢹⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡄⠀⠀⢳⠀⠀⠀⠀⠀⢀⣼⣿⡿⠀⠀⠀⠀⠹⣄⠀⢹⣇⠀ ]],
		[[⠘⡆⢰⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⡇⠀⠀⠀⣠⣾⣿⣿⠇⠀⠀⠀⠀⢀⠈⠙⣿⣿⠀ ]],
		[[⠀⠸⡄⢹⠆⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⢸⠀⠤⠊⢁⠟⣿⢿⣦⣀⣀⣾⣿⠟⣧⣴⠿⡯⠀ ]],
		[[⠀⠀⠉⠉⠳⢄⡙⠢⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢆⠀⠀⢸⠀⢀⡠⠊⠀⠘⢦⣢⡈⠉⠻⢿⠿⠋⢀⠔⠁⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⠈⠙⠒⠒⠶⠒⠒⠒⠈⠉⠉⠉⠉⠉⠉⠒⠒⠪⠷⠒⠛⠊⠉⠀⠠⠄⠀⠤⣌⠛⠳⠦⠤⠴⠒⠁⠀⠀⠀ ]],
	}

	local function button(sc, txt, leader_txt, keybind, keybind_opts)
		local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

		local opts = {
			position = "center",
			shortcut = sc,
			cursor = 5,
			width = 50,
			align_shortcut = "right",
			hl_shortcut = "Keyword",
		}

		if nil == keybind then
			keybind = sc_after
		end
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_after, keybind, keybind_opts }

		local function on_press()
			-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
			local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
			vim.api.nvim_feedkeys(key, "t", false)
		end

		return {
			type = "button",
			val = txt,
			on_press = on_press,
			opts = opts,
		}
	end

	local leader = "SPC"
	dashboard.section.buttons.val = {
		button("SPC s c", " Scheme change", leader, "<cmd>Telescope colorscheme<cr>"),
		button("SPC s h", " File frecency", leader, "<cmd>Telescope frecency<cr>"),
		button("SPC s o", " File history", leader, "<cmd>Telescope oldfiles<cr>"),
		button("SPC s p", " Project find", leader, "<cmd>Telescope project<cr>"),
		button("SPC s s", " File find", leader, "<cmd>Telescope find_files<cr>"),
		button("enew", " File new", leader, "<cmd>enew<cr>"),
		button("SPC s g", " Word find", leader, "<cmd>Telescope live_grep<cr>"),
	}
	dashboard.section.buttons.opts.hl = "String"

	local function footer()
		local total_plugins = #vim.tbl_keys(packer_plugins)
		return "neovim"
			.. " v"
			.. vim.version().major
			.. "."
			.. vim.version().minor
			.. "."
			.. vim.version().patch
			.. " with "
			.. total_plugins
			.. " plugins"
	end

	dashboard.section.footer.val = footer()
	dashboard.section.footer.opts.hl = "Function"

	local head_butt_padding = 2
	local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
	local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
	local foot_butt_padding = 1

	dashboard.config.layout = {
		{ type = "padding", val = header_padding },
		dashboard.section.header,
		{ type = "padding", val = head_butt_padding },
		dashboard.section.buttons,
		{ type = "padding", val = foot_butt_padding },
		dashboard.section.footer,
	}

	alpha.setup(dashboard.opts)
end
