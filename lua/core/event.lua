-- Now use `<A-k>` or `<A-1>` to back to the `dotstutor`.
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command("augroup END")
	end
end

-- auto close NvimTree
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
	pattern = "NvimTree_*",
	callback = function()
		local layout = vim.api.nvim_call_function("winlayout", {})
		if
			layout[1] == "leaf"
			and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
			and layout[3] == nil
		then
			vim.api.nvim_command([[confirm quit]])
		end
	end,
})

-- auto close some filetype with <q>
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"qf",
		"help",
		"man",
		"notify",
		"nofile",
		"lspinfo",
		"terminal",
		"prompt",
		"toggleterm",
		"copilot",
		"startuptime",
		"tsplayground",
		"PlenaryTestPopup",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.api.nvim_buf_set_keymap(event.buf, "n", "q", "<CMD>close<CR>", { silent = true })
	end,
})

-- Fix fold issue of files opened by telescope
vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		vim.api.nvim_create_autocmd("BufWinEnter", {
			once = true,
			command = "normal! zx",
		})
	end,
})

function autocmd.load_autocmds()
	local definitions = {
		lazy = {},
		bufs = {
			{ "BufWritePost", "*", "FormatWrite" },
			{ "BufWritePre", "/tmp/*", "setlocal noundofile" },
			{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
			{ "BufWritePre", "MERGE_MSG", "setlocal noundofile" },
			{ "BufWritePre", "*.tmp", "setlocal noundofile" },
			{ "BufWritePre", "*.bak", "setlocal noundofile" },
		},
		wins = {
			-- Check if file changed when its window is focus, more eager than 'autoread'
			{ "FocusGained", "* checktime" },
			-- Equalize window dimensions when resizing vim window
			-- { "VimResized", "*", [[tabdo wincmd =]] },

			-- Highlight current line only on focused window
			{
				"WinEnter,BufEnter,InsertLeave",
				"*",
				[[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]],
			},
		},
		ft = {
			{ "FileType", "alpha", "set showtabline=0" },
			{ "FileType", "markdown", "set wrap" },

			{ "FileType", "json", "setlocal tabstop=4" },
			{ "FileType", "json", "setlocal shiftwidth=4" },
			{ "FileType", "json", "setlocal expandtab" },

			{ "FileType", "jsonc", "setlocal tabstop=4" },
			{ "FileType", "jsonc", "setlocal shiftwidth=4" },
			{ "FileType", "jsonc", "setlocal expandtab" },

			{ "FileType", "json", "setlocal tabstop=4" },
			{ "FileType", "json", "setlocal shiftwidth=4" },
			{ "FileType", "json", "setlocal expandtab" },

			{ "FileType", "yaml", "setlocal tabstop=2" },
			{ "FileType", "yaml", "setlocal shiftwidth=2" },
			{ "FileType", "yaml", "setlocal expandtab" },

			{ "FileType", "css", "setlocal tabstop=4" },
			{ "FileType", "css", "setlocal shiftwidth=4" },
			{ "FileType", "css", "setlocal expandtab" },

			{ "FileType", "toml", "setlocal tabstop=4" },
			{ "FileType", "toml", "setlocal shiftwidth=4" },
			{ "FileType", "toml", "setlocal expandtab" },
		},
		yank = {},
	}

	autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
