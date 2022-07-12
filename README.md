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

The spacenvim is well tested in neovim `v0.7.x`, if you are using a lower version, there may be a risk of incompatibility.

## Install

First of all, you should have [Neovim](https://neovim.io) installed in your machine. If you are using mac, run:

```shell
brew install neovim
```

spacenvim has some additional dependencies:

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

Then, just enter neovim and execute the `PackerInstall` and `PackerCompile` commands to complete the installation.

**Note that the `PackerInstall` command may fail due to network reasons, please try several times.**

**The `PackerCompile` command must be executed after the `PackerInstall` command is successful, otherwise errors might be reported when starting neovim.**
