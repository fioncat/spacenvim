# Spacenvim

![screenshot](https://raw.githubusercontent.com/fioncat/images/master/neovim/screenshot.png)

This neovim configuration is a personal customization based on [ayamir/nvimdots](https://github.com/ayamir/nvimdots).

Updates to plugins may corrupt the current configuration and cause unexpected behavior. So I save the stable versions of plugins in [snapshot](snapshot). If you want nvim to behave as expected from the Spacenvim, you can choose to use snapshot during installation.

Spacenvim only support neovim `0.8.x`, if you are using a lower version, please upgrade neovim first.

## Install

You should have [neovim](https://neovim.io) installed in your machine:

<details>
<summary>Install neovim on Mac</summary>

```bash
brew install neovim
```

</details>

<details>
<summary>Install neovim on ArchLinux</summary>

```bash
sudo pacman -S neovim
```

</details>

Spacenvim requires `Nerd Font` to display `iconic fonts`, you should go to [Nerd Font Downloads](https://www.nerdfonts.com/font-downloads) to choose a Nerd Font you like and install it in the terminal. Otherwise spacenvim will display garbled characters.

The terminal type should be `xterm-256color` to make spacenvim display the correct colors, add this to your terminal profile:

```bash
export TERM=xterm-256color
```

If you are using spacenvim in `tmux`, add this to your tmux profile:

```bash
set -g default-terminal "tmux-256color"
set-option -ga terminal-overrides ",xterm-256color:Tc"
```

Spacenvim has some additional dependencies:

<details>
<summary>Install dependencies on Mac</summary>

```bash
brew install sqlite3 fzf rg
```

</details>

<details>
<summary>Install dependencies on ArchLinux</summary>

```bash
sudo pacman -S sqlite3 fzf ripgrep xclip zip unzip
```

</details>

Install spacenvim:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/fioncat/spacenvim/HEAD/scripts/install.sh)"
```

If you update the plugins and find that they are not compatible with Spacenvim, you can execute the following command to rollback the plugins versions to the expected:

```bash
cd ~/.config/nvim
make rollback
```

## Language Support

You can use command `Mason` to manage your `LSP servers`, some language plugins need additional requirements:

<details>
<summary>Golang</summary>

```bash
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/fatih/gomodifytags@latest
go install github.com/go-delve/delve/cmd/dlv@latest
```

</details>
