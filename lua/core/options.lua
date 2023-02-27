local global = require("core.global")

local function load_options()
	local global_local = {
    	-- Diable compatible with vi
		nocompatible = true,

		-- Some plugins might need this
		encoding = "UTF-8",

		-- Relative Number
		number = true,
		relativenumber = true,

		cursorline = true,

		showmatch = true,

		foldenable = true,
		foldlevelstart = 99,

		ts = 4,
		shiftwidth = 4,

		-- NOTE: If you enable this, the <TAB> will be replaced to spaces
		-- expandtab = true,

		autoindent = true,

		splitright = true,
		splitbelow = true,

		incsearch = true,
		-- Use command `:noh` or shortcut <C-L> to clean hlsearch
		hlsearch = true,
		-- Search ignore case
		ignorecase = true,

		noswapfile = true,

		cmdheight = 1,

		-- The command completion provided by vim
		wildmenu = true,
		wildmode = "longest,list",

		-- autoload file when it is changed on disk by other instance
		autoread = true,

		-- Disable bell in terminal
		noeb = true,
		vb = true,
		t_vb = "",

		laststatus = 2,
		display = "lastline",

		background = "dark",
		termguicolors = true,

		-- Always show signcolumn
		signcolumn = "yes:1",

		-- Show tail whitespace
		listchars = [[tab:  ,trail:•]],
		list = true,
	}
	local function isempty(s)
		return s == nil or s == ""
	end

	-- custom python provider
	local conda_prefix = os.getenv("CONDA_PREFIX")
	if not isempty(conda_prefix) then
		vim.g.python_host_prog = conda_prefix .. "/bin/python"
		vim.g.python3_host_prog = conda_prefix .. "/bin/python"
	elseif global.is_mac then
		vim.g.python_host_prog = "/usr/bin/python"
		vim.g.python3_host_prog = "/usr/local/bin/python3"
	else
		vim.g.python_host_prog = "/usr/bin/python"
		vim.g.python3_host_prog = "/usr/bin/python3"
	end

	for name, value in pairs(global_local) do
		vim.o[name] = value
	end

	-- Fix sqlite3 missing-lib issue on Windows
	if global.is_windows then
		-- Download the DLLs form https://www.sqlite.org/download.html
		vim.g.sqlite_clib_path = global.home .. "/Documents/sqlite-dll-win64-x64-3400100/sqlite3.dll"
	end
end

load_options()
