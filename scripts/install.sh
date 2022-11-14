#!/bin/bash

# Donot allow undefined variables
set -u

DEST_PATH="${HOME}/.config/nvim"
DEST_URL="https://github.com/fioncat/spacenvim.git"

PACKER_ROOT="${HOME}/.local/share/nvim/site/pack/packer"
PACKER_PATH="${PACKER_ROOT}/start/packer.nvim"
PACKER_URL="https://github.com/wbthomason/packer.nvim"

if [[ -t 1 ]]; then
	tty_escape() { printf "\033[%sm" "$1"; }
else
	tty_escape() { :; }
fi

# TTY color placeholders. Usage: ${tty_*}xxx${tty_reset}
tty_yellow="$(tty_escape "0;33")"
tty_blue="$(tty_escape "0;34")"
tty_red="$(tty_escape "0;31")"
tty_cyan="$(tty_escape "0;36")"
tty_reset="$(tty_escape 0)"

on_error() {
	printf "${tty_red}error:${tty_reset} $@\n" >&2
	exit 1
}

shell_join() {
	local arg
	printf "%s" "$1"
	shift
	for arg in "$@"; do
		printf " "
		printf "%s" "${arg// /\ }"
	done
}

execute() {
	shell_exec=$(shell_join "$@")
	printf "==> ${tty_cyan}${shell_exec}${tty_reset}\n"
	if ! "$@"; then
		on_error "command ${tty_cyan}${shell_exec}${tty_reset} exited with error"
	fi
}

ensure_command() {
	if ! command -v $1 >/dev/null; then
		on_error "command ${tty_cyan}$1${tty_reset} is required to install spacenvim, please install it first."
	fi
}

confirm() {
	read -p "$1 (y/n) " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		return 0
	fi
	if [ $2 == "true" ]; then
		on_error "user aborted"
	fi
	return 1
}

hint() {
	echo "* ${tty_yellow}$1${tty_reset}"
}

ensure_command "perl"
ensure_command "git"
ensure_command "nvim"
ensure_command "python3"

confirm "Install Spacenvim?" "true"
if [ -d ${DEST_PATH} ]; then
	confirm "Found an existing neovim config ${tty_blue}${DEST_PATH}${tty_reset}, remove it?" "false"
	if [ $? == 0 ]; then
		execute "rm" "-r" "${DEST_PATH}"
	fi
fi
if [ ! -d ${DEST_PATH} ]; then
	execute "git" "clone" "${DEST_URL}" "${DEST_PATH}"
fi

if [ ! -d ${PACKER_PATH} ]; then
	execute "git" "clone" "${PACKER_URL}" "${PACKER_PATH}"
fi

echo
hint "Now we will open nvim to install plugins, this may take a long time."
hint "If any plugin installation fails, you MUST execute PackerInstall"
hint "manually to make sure all plugins are installed successfully."
hint "Otherwise nvim will report error."
confirm "Please quit nvim after installation done, continue?" "true"
execute "nvim" "+PackerInstall"

echo
hint "Use recommended versions will pin all plugins versions to snapshot."
hint "This can make nvim more stable."
hint "If you want to update plugins, please execute PackerSync in nvim."
hint "If you want to rollback plugins, please run:"
hint "  cd ~/.config/nvim; make rollback"
confirm "Do you want to use recommended versions for plugins?" "false"
if [ $? == 0 ]; then
	execute "cd" "${DEST_PATH}"
	execute "make" "rollback"
fi

echo
hint "Now we will open nvim to compile plugins."
confirm "Please quit nvim after compilation done, continue" "true"
execute "nvim" "+PackerCompile"

echo
echo "Spacenvim was successfully installed to your machine! Thanks for using."
