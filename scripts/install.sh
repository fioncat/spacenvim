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

read -p "About to open nvim to install plugins, please exit after installation done, press any key to continue... " -n 1 -r
nvim +'PackerInstall'

read -p "Do you want to use plugins snapshot? This can make nvim more stable (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	python3 ./scripts/snapshot/rollback.py
fi

read -p "About ot open nvim to finish installation, press any key to continue... " -n 1 -r
nvim +'PackerCompile'

echo "Done, happy using spacenvim!"
