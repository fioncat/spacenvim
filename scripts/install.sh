#!/bin/bash

set -e

command -v nvim >/dev/null || { echo "ERROR: cannot find neovim, please install neovim 0.7.x"; exit 1; }

# TODO: install dependencies

packer_root="$HOME/.local/share/nvim/site/pack/packer"
packer_home="$packer_root/start/packer.nvim"

if [ ! -d $packer_home ]; then
	git clone https://github.com/wbthomason/packer.nvim $packer_home
fi

bash ./scripts/apply_snapshot.sh

cur_dir=$(pwd)

cd $packer_root/opt/telescope-fzf-native.nvim
make

cd $cur_dir
