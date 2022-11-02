# Spacenvim

![screenshot](https://raw.githubusercontent.com/fioncat/images/master/neovim/screenshot.png)

This neovim configuration is a personal customization based on [ayamir/nvimdots](https://github.com/ayamir/nvimdots).

I pinned the versions of all plugins to prevent configuration incompatibilities due to plugin updates. Please use `make` to install or upgrade plugins rather than PackerInstall.

The `master` branch is based on neovim `0.8.x`. If you are using neovim `0.7.x`, please switch to branch `0.7`, the configuration is incompatible. But branch `0.7` is no longer maintained, it is more recommanded to upgrade neovim to `0.8.x`.

## Install

You should have [Neovim](https://neovim.io) installed in your machine:

<details>
<summary>Install neovim on Mac</summary>

```shell
brew install neovim
```

</details>

<details>
<summary>Install neovim on ArchLinux/Manjaro</summary>

```shell
sudo pacman -S neovim
```

</details>

Before continuing, please use `nvim -v` to confirm the version is `0.8.x`.

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
sudo pacman -S sqlite3 fzf ripgrep xclip zip unzip
```

</details>

Install spacenvim:

```shell
git clone https://github.com/fioncat/spacenvim.git $HOME/.config/nvim
cd $HOME/.config/nvim
make install
```

This will clone all expected plugins to local.

If you want to upgrade plugins, run:

```shell
make upgrade
```

If you want to remove all plugins, run:

```shell
make clean
```

## Language Support

You can use command `Mason` to manage your `LSP servers`, some language plugins need additional requirements:

<details>
<summary>Golang</summary>

```shell
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/fatih/gomodifytags@latest
go install github.com/go-delve/delve/cmd/dlv@latest
```

</details>
