local bind = require("config.keybind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd


local key_mapping = {
	-- 分屏
	["n|<leader>w/"] = map_cr("vs"):with_noremap():with_silent(),
	["n|<leader>w-"] = map_cr("sv"):with_noremap():with_silent(),

	-- 调整窗口大小
	["n|<leader>w["] = map_cmd(":vertical resize+"):with_noremap(),
	["n|<leader>w]"] = map_cmd(":vertical resize-"):with_noremap(),

	-- 内置终端
	['n|<leader>"'] = map_cr("VTerm"):with_noremap():with_silent(),
	["n|<leader>'"] = map_cr("Term"):with_noremap():with_silent(),
	-- 一键关闭终端
	["t|<C-Q>"] = map_cmd("exit<CR>"):with_noremap():with_silent(),

	-- 打开当前文件的FileTree
	["n|<leader>ff"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
	["n|<leader>tt"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),

	-- 搜索相关命令
	["n|<leader>sf"] = map_cr("Telescope git_files"):with_noremap():with_silent(),
	["n|<leader>sg"] = map_cr("Telescope live_grep"):with_noremap():with_silent(),
	["n|<leader>sb"] = map_cr("Telescope buffers"):with_noremap():with_silent(),
	["n|<leader>ss"] = map_cr("Telescope find_files"):with_noremap():with_silent(),
	["n|<leader>sl"] = map_cr("Telescope lsp_dynamic_workspace_symbols"):with_noremap():with_silent(),
	["n|<leader>sd"] = map_cr("Telescope lsp_document_symbols"):with_noremap():with_silent(),

	-- LSP相关，代码跳转
	["n|gd"] = map_cr("Telescope lsp_definitions"):with_noremap():with_silent(),
	["n|gr"] = map_cr("Telescope lsp_references"):with_noremap():with_silent(),
	["n|gi"] = map_cr("Telescope lsp_implementations"):with_noremap():with_silent(),
	["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
	["n|<leader>en"] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
	["n|<leader>ep"] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
	["n|<leader>ee"] = map_cr("Trouble"):with_noremap():with_silent(),

	-- 快速注释
	["n|<leader>ci"] = map_cr("CommentToggle"):with_noremap():with_silent(),
	["v|<leader>ci"] = map_cr("CommentToggle"):with_silent(),

	-- 显示Git blame
	["n|<leader>gb"] = map_cr("Git blame"):with_noremap():with_silent(),

	-- Buffer 快速跳转
	["n|<leader>bb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
	["n|<leader>bn"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
	["n|<leader>bp"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
	["n|<leader>1"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
	["n|<leader>2"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
	["n|<leader>3"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
	["n|<leader>4"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
	["n|<leader>5"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
	["n|<leader>6"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
	["n|<leader>7"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
	["n|<leader>8"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
	["n|<leader>9"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
	-- 删除buffer
	["n|<leader>bd"] = map_cr("Bdelete"):with_noremap():with_silent(),
	["n|<leader>bc"] = map_cr("BufClean"):with_noremap():with_silent(),

	-- Hop: 快速跳转
	["n|<leader>jj"] = map_cr("HopLine"):with_noremap():with_silent(),
	["n|<leader>jw"] = map_cr("HopWord"):with_noremap():with_silent(),
}

vim.g.mapleader = " "
bind.nvim_load_mapping(key_mapping)
