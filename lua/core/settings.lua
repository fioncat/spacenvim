local settings = {}

-- Set it to false if you want to use https to update plugins and treesitter parsers.
settings["use_ssh"] = true

---Change the colors of the global palette here.
---Settings will complete their replacement at initialization.
---Parameters will be automatically completed as you type.
---Example: { sky = "#04A5E5" }
---@type palette
settings["palette_overwrite"] = {}

-- Set the colorscheme to use here.
-- Available values are: `catppuccin`, `catppuccin-latte`, `catppucin-mocha`, `catppuccin-frappe`, `catppuccin-macchiato`, `edge`, `nord`.
settings["colorscheme"] = "catppuccin"

-- Set background color to use here.
-- Useful for when you want to use a colorscheme that has a light and dark variant like `edge`.
-- Available values are: `dark`, `light`.
settings["background"] = "dark"

-- Set the desired LSPs here.
-- check the below link for all the supported LSPs:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
settings["lsp"] = {
	"bashls",
	"clangd",
	"html",
	"jsonls",
	"lua_ls",
	"pyright",
	"gopls",
	"rust_analyzer",
}

return settings
