-- Custome your vim options here.

local options = {
	-- Diable compatible with vi
	nocompatible = true,

	-- Some plugins might need this
	encoding = 'UTF-8',

	-- Relative Number
	number = true,
	relativenumber = true,

	cursorline = true,

	showmatch = true,

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
	t_vb = '',

	laststatus = 2,
	display = "lastline",

	background = 'dark',
	termguicolors = true,

	-- Always show signcolumn
	signcolumn='yes:1',

	-- Show tail whitespace
	listchars = [[tab:▸\ ,trail:•]],
	list = true,
}

for k, v in pairs(options) do
	if v == true then
		vim.cmd("set " .. k)
	elseif v == false then
		vim.cmd("set no" .. k)
	else
		vim.cmd("set " .. k .. "=" .. v)
	end
end
