#!/bin/bash

set -e

if [[ -d $HOME/.config/nvim ]]; then
	echo "A previous version of neovim configuration was detected, please backup or delete it: ~/.config/nvim"
	exit 1
fi

if [[ -d $HOME/.local/share/nvim ]]; then
	echo "A previous version of neovim plugins library was detected, please backup or delete it: ~/.local/share/nvim"
	exit 1
fi

# PACKER_COMMIT_ID="e4c2afb37d31e99b399425e102c58b091fbc16be"
echo "Installing packer.nvim..."
git clone https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim > /dev/null

echo "Installing Spacenvim..."
git clone https://github.com/fioncat/spacenvim.git $HOME/.config/nvim > /dev/null

echo "Congratulations! Spacenvim was successfully installed on your machine."
echo 'To complete the plugin installation, open neovim and execute the `PackerInstall` and `PackerCompile` commands.'
echo "For more infomation, please refer to: https://github.com/fioncat/spacenvim"
