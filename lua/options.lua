local options = {
	-- 关闭兼容模式
	nocompatible = true,

	-- 编码集，某些插件需要这个配置
	encoding = 'UTF-8',

	-- 显示相对行号
	number = true,
	relativenumber = true,

	-- 突出显示当前行
	cursorline = true,

	-- 突出显示搜索匹配项
	showmatch = true,

	-- tab占用4空格
	ts = 4,
	shiftwidth = 4,

	-- TODO: 开启之后，使用spaces代替tab进行插入
	-- expandtab = true,

	-- 自动对齐
	autoindent = true,

	-- 分屏在右边和下面打开
	splitright = true,
	splitbelow = true,

	-- 实时搜索模式
	incsearch = true,
	-- 搜索高亮，需要通过:noh关闭
	hlsearch = true,

	-- 搜索忽略大小写
	ignorecase = true,

	-- 不生成中间临时文件
	noswapfile = true,

	-- 命令行高度
	cmdheight = 1,

	-- vim自带的命令行补全
	wildmenu = true,
	wildmode = "longest,list",

	-- 文件有变更时，自动重新加载
	autoread = true,

	-- 关闭响铃
	noeb = true,
	vb = true,
	t_vb = '',

	laststatus = 2,
	display = "lastline",

	-- 主题相关配置
	background = 'dark',
	termguicolors = true,

	signcolumn='yes:1',

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

vim.cmd('vmap cy "+y')

-- :w命令时常会误输入为:W，因此这里做一个映射
vim.cmd([[cnoreabbrev W w]])

-- Ctrl-A 跳转到当前行首，就像Emacs那样
-- 重新将Ctrl-S映射为数字加2
vim.cmd([[nnoremap <C-s> <C-a>]])
vim.cmd([[nnoremap <C-a> ^]])

-- git blamer配置
vim.cmd([[let g:blamer_date_format = '%y-%m-%d']])
vim.cmd([[let g:blamer_show_in_visual_modes = 0]])
vim.cmd([[let g:blamer_show_in_insert_modes = 0]])

vim.cmd([[autocmd FileType json setlocal tabstop=2]])
vim.cmd([[autocmd FileType json setlocal shiftwidth=2]])
vim.cmd([[autocmd FileType json setlocal expandtab]])

vim.cmd([[autocmd FileType yaml setlocal tabstop=2]])
vim.cmd([[autocmd FileType yaml setlocal shiftwidth=2]])
vim.cmd([[autocmd FileType yaml setlocal expandtab]])
