# Spacenvim

My personal neovim config forked from [ayamir/nvimdots](https://github.com/ayamir/nvimdots).

## Prerequisites

ArchLinux:

```bash
sudo pacman -S git lazygit ripgrep fd yarn lldb nvm make unzip python-pynvim fzf

# nodejs required by copilot.lua
# node version must > 16.x (18 for example)
nvm install 18
nvm use 18

# cargo/rustc required by sniprun and rustfmt
sudo pacman -S rustup
rustup toolchain install nightly # or stable
```

Ubuntu:

```bash
sudo apt install git unzip make cmake gcc g++ clang zoxide ripgrep fd-find yarn lldb python3-pip  python3-venv

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# nvm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm install 18
nvm use 18

# cargo/rustc required by sniprun and rustfmt
curl https://sh.rustup.rs -sSf | sh
```

MacOS:

```bash
brew install git lazygit zoxide ripgrep fd yarn nvm make unzip neovim
# Noted that installing sqlite may require to manually modify the .zshrc file (follow the instruction shown with brew when installing)
nvm install 18
nvm use 18
rustup toolchain install stable # nightly is not yet tested
```

## Install

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/fioncat/spacenvim/HEAD/scripts/install.sh)"
```

## Copilot

By default, [copilot](https://github.com/features/copilot) is enabled, you need to run `:Copilot auth` to start the authentication process.

After authentication is done, then you are ready to use copilot!
