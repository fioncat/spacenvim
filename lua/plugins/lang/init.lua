local M = {}

-- nvim-dap is a Debug Adapter Protocol client implementation for Neovim.
M["mfussenegger/nvim-dap"] = {
	opt = true,
	cmd = {
		"DapSetLogLevel",
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
	},
	module = "dap",
	config = require("plugins.lang.dap"),
}

M["rcarriga/nvim-dap-ui"] = {
	opt = true,
	after = "nvim-dap",
	config = require("plugins.lang.dapui"),
}

M["mhartington/formatter.nvim"] = {
	opt = true,
	config = require("plugins.lang.formatter"),
	cmd = {
		"FormatWrite",
		"Format",
	},
}

return M
