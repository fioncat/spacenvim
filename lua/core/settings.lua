local settings = {}

-- Set it to false if you want to use https to update plugins and treesitter parsers.
settings["use_ssh"] = true

---Change the colors of the global palette here.
---Settings will complete their replacement at initialization.
---Parameters will be automatically completed as you type.
---Example: { sky = "#04A5E5" }
---@type palette
settings["palette_overwrite"] = {}

-- Set it to false if diagnostics virtual text is annoying.
-- If disabled, you may browse lsp diagnostics using trouble.nvim (press `gt` to toggle it).
---@type boolean
settings["diagnostics_virtual_text"] = true

-- Set it to one of the values below if you want to change the visible severity level of lsp diagnostics.
-- Priority: `Error` > `Warning` > `Information` > `Hint`.
--  > e.g. if you set this option to `Warning`, only lsp warnings and errors will be shown.
-- NOTE: This entry only works when `diagnostics_virtual_text` is true.
---@type "Error"|"Warning"|"Information"|"Hint"
settings["diagnostics_level"] = "Hint"

-- Set the command for handling external URLs here. The executable must be available on your $PATH.
-- This entry is IGNORED on Windows and macOS, which have their default handlers builtin.
---@type string
settings["external_browser"] = "chrome-cli open"

-- Set the colorscheme to use here.
-- Available values are: `catppuccin`, `catppuccin-latte`, `catppucin-mocha`, `catppuccin-frappe`, `catppuccin-macchiato`, `edge`, `nord`.
settings["colorscheme"] = "catppuccin"

-- Set background color to use here.
-- Useful for when you want to use a colorscheme that has a light and dark variant like `edge`.
-- Available values are: `dark`, `light`.
settings["background"] = "dark"

-- Set it to true if your terminal has transparent background.
---@type boolean
settings["transparent_background"] = false

-- Set the desired LSPs here.
-- check the below link for all the supported LSPs:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
settings["lsp"] = {
	"bashls",
	"html",
	"jsonls",
	"lua_ls",
	"pyright",
	"gopls",
	"rust_analyzer",
}

return settings
