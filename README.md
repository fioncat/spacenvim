# Spacenvim

This configuration comes from [ayamir/nvimdots](https://github.com/ayamir/nvimdots), but there are the following differences:

- Use `Space` key as leader.
- The code layout is simpler more user-friendly.
- Pinned the version for all plugins. Update plugins manually to prevent breaking changes making the configuration invalid.
- Try to keep the minimum number of plugins and easy to customize.

The features of this configuration are:

- Completely based on Lua configuration, abandon Vimscript.
- Use Lua plugins instead of classic plugins. For example: use [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting, [telescope](https://github.com/nvim-telescope/telescope.nvim) for searching, [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) for file tree, [lualine.nvim](https://github.com/hoob3rt/lualine.nvim) for statusline, native lsp for code completion, etc.
- Quick installation and customization.
- Very Fast!

## Install

First of all, you should have [Neovim](https://neovim.io) installed in your machine. If you are using mac, run:

```shell
brew install neovim
```

The spacenvim is well tested in neovim `v0.7.x`, if you are using a lower version, there may be a risk of incompatibility. You can use `nvim -version` to check it.

Spacenvim requires Nerd Font to display some special characters, you should go to [Nerd Font Downloads](https://www.nerdfonts.com/font-downloads) to choose a Nerd Font you like and install it in the terminal. Otherwise spacenvim will display garbled characters.

The terminal type should be `xterm-256color` to make spacenvim display the correct colors, add this to your terminal profile:

```bash
export TERM=xterm-256color
```

Also, if you are using `tmux`, add this to your tmux profile:

```tmux
set -g default-terminal "tmux-256color"
set-option -ga terminal-overrides ",xterm-256color:Tc"
```

Spacenvim has some additional dependencies:

```shell
brew install sqlite3
brew install fzf
brew install rg
brew install node
brew install bat
```

Now, you only need to run a simple command to install spacenvim:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/fioncat/spacenvim/master/install.sh)"
```

Then, just enter neovim (using command `nvim`) and execute the `PackerInstall` and `PackerCompile` commands to complete the installation.

**Note that the `PackerInstall` command may fail due to network reasons, please try several times.**

**The `PackerCompile` command must be executed after the `PackerInstall` command is successful, otherwise errors might be reported when starting neovim.**

Goodbye vim: `alias vim='nvim'`.

## Coding support

When you first open a code file with spacenvim, the treesitter plugin will try to download all syntax highlighting support. This may take a while. When the download is complete, please reopen the editor and you will find that treesitter syntax highlighting has taken effect. If some of them download fail, reopening the editor will trigger a redownload.

Spacenvim uses native lsp, and plugin [williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) to install lsp servers for different languages.

You can use `LspInstallInfo` to display the lsp server list. Use `LspInstall <lsp-server>` to install a lsp server. Also, you can open a code file with spacenvim, and execute `LspInstall` with no args, the plugin will automatically select the appropriate lsp server for you based on the current code.

Some language features may requires additional tools. For example, Go requires `goimports`, `gotags`, `delve`, etc.

## Layout

The layout of this configuration is very simple:

- [lua/options.lua](lua/options.lua): Basic vim configuration options.
- [lua/plugins.lua](lua/plugins.lua): Plugin list.
- [lua/config](lua/config): Plugin configuration.
- [lua/keymap.lua](lua/keymap.lua): Edit shortcut keys.
- [snippets](snippets): Customized code snippet. The format is vscode-like.

You can edit these files to customize your neovim easily. But notice that if you change the files under `lua/config`, you need to execute `PackerCompile` to take affect.

## Screenshot

![](images/screenshot-0.jpg)

![](images/screenshot-1.jpg)

![](images/screenshot-2.jpg)
