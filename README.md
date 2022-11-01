# Spacenvim

This neovim configuration is a personal customization based on [ayamir/nvimdots](https://github.com/ayamir/nvimdots).

**I pinned the versions of all plugins to prevent configuration incompatibilities due to plugin updates. Please use `make` to install or upgrade plugins rather than PackerInstall.**

**The `master` branch is based on neovim `0.8.x`. If you are using neovim `0.7.x`, please switch to branch `0.7`, the configuration is incompatible. But this branch is no longer maintained, it is more recommanded to upgrade neovim to `0.8.x`.**

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

<details>
<summary>Install dependencies on Mac</summary>

```shell
brew install sqlite3 fzf rg
```

</details>

<details>
<summary>Install dependencies on ArchLinux/Manjaro</summary>

```shell
sudo pacman -S sqlite3 fzf ripgrep xclip
```

</details>

Install spacenvim:

```shell
git clone https://github.com/fioncat/spacenvim.git $HOME/.config/nvim
cd $HOME/.config/nvim
make
```
