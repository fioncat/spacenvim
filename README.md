# Spacenvim

This neovim configuration is a personal customization based on [ayamir/nvimdots](https://github.com/ayamir/nvimdots).

Features:

- Completely based on Lua configuration, abandon Vimscript.
- Use Lua plugins instead of classic vim plugins.
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
