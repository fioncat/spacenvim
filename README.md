# Spacenvim

This neovim configuration is a personal customization based on [ayamir/nvimdots](https://github.com/ayamir/nvimdots).

Features:

- Completely based on Lua configuration, abandon Vimscript.
- Use Lua plugins instead of classic vim plugins.
- Quick installation and customization.
- Very Fast!

## Install

You should have [Neovim](https://neovim.io) installed in your machine:

```shell
brew install neovim
```

The spacenvim is well tested in neovim `v0.7.x`, if you are using a lower version, there may be a risk of incompatibility. You can use `nvim -version` to check it.

Spacenvim requires `Nerd Font` to display `iconic fonts`, you should go to [Nerd Font Downloads](https://www.nerdfonts.com/font-downloads) to choose a Nerd Font you like and install it in the terminal. Otherwise spacenvim will display garbled characters.

The terminal type should be `xterm-256color` to make spacenvim display the correct colors, add this to your terminal profile:

```bash
export TERM=xterm-256color
```

If you are using spacenvim in `tmux`, add this to your tmux profile:

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

Install spacenvim:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/fioncat/spacenvim/master/install.sh)"
```

The spacenvim will be installed to `~/.config/nvim`,  Spacenvim use [packer](https://github.com/wbthomason/packer.nvim) to manage plugins, you should open neovim (using command `nvim`) and execute `PackerInstall` and `PackerCompile` to complete the plugin installation. For more infomation about packer, please go to [official documentation](https://github.com/wbthomason/packer.nvim/blob/master/doc/packer.txt).

**Note that the `PackerInstall` command may fail due to network reasons, please try several times.**

When you first open spacenvim, the `treesitter` will try to install the `syntax highlight`, and the `mason` will try to install some `LSP servers`. Some functions are unavailable until the installation is complete.

## Snapshot

By default, we will install the latest version of the plugins for you. But plugins may be incompatible with spacenvim due to the breaking changes. This can cause plugins to behave inconsistently as expected, and even neovim to report errors.

If this happens, you can rollback the plugins version to the version expected by spacenvim.

Spacenvim stores plugins snapshot in `~/.config/nvim/snapshot`, you can import the snapshot file by:

```shell
cp ~/.config/nvim/snapshot ~/.cache/nvim/packer.nvim/spacenvim
```

Then enter the neovim and execute:

```shell
:PackerSnapshotRollback spacenvim
```

This will pin the plugins to the expected version. You can refer to the snapshort section of [packer doc](https://github.com/wbthomason/packer.nvim/blob/master/doc/packer.txt) to learn more.
