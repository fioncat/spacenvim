#!/bin/bash

set -e

command -v nvim >/dev/null || { echo "ERROR: cannot find neovim, please install neovim 0.7.x"; exit 1; }
command -v python3 >/dev/null || { echo "ERROR: cannot find python3 which is required to build spacenvim"; exit 1; }

# TODO: install dependencies

packer_root="$HOME/.local/share/nvim/site/pack/packer"
packer_home="$packer_root/start/packer.nvim"

if [ ! -d $packer_home ]; then
	git clone https://github.com/wbthomason/packer.nvim $packer_home
fi

nvim +'PackerInstall'
python3 ./scripts/snapshot/rollback.py
nvim +'PackerCompile'
