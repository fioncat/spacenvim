#!/bin/bash

set -u

DEST_PATH="${HOME}/.config/nvim"
DEST_URL="https://github.com/fioncat/spacenvim.git"
BACKUP_DIR=$(pwd)

# string formatters
if [[ -t 1 ]]; then
	tty_escape() { printf "\033[%sm" "$1"; }
else
	tty_escape() { :; }
fi

tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_yellow="$(tty_escape "0;33")"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

abort() {
	cd ${BACKUP_DIR}
	printf "%s\n" "$@" >&2
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
	if ! "$@"; then
		abort "$(printf "${tty_red}Failed during${tty_reset}: %s" "$(shell_join "$@")")"
	fi
}

getc() {
	local save_state
	save_state="$(/bin/stty -g)"
	/bin/stty raw -echo
	IFS='' read -r -n 1 -d '' "$@"
	/bin/stty "${save_state}"
}

wait_for_user() {
	local c
	echo
	echo "Press ${tty_bold}RETURN${tty_reset}/${tty_bold}ENTER${tty_reset} to continue or any other key to abort..."
	getc c
	# we test for \r and \n because some stuff does \r instead
	if ! [[ "${c}" == $'\r' || "${c}" == $'\n' ]]; then
		echo "${tty_red}User aborted${tty_reset}"
		exit 1
	fi
}

if ! command -v perl >/dev/null; then
	abort "$(
		cat <<EOABORT
Perl is required to interpret this script. See:
  ${tty_underline}https://www.perl.org/get.html${tty_reset}
EOABORT
	)"
fi

if ! command -v nvim >/dev/null; then
	abort "$(
		cat <<EOABORT
You must install neovim before installing Spacenvim. See:
  ${tty_underline}https://github.com/neovim/neovim/wiki/Installing-Neovim${tty_reset}
EOABORT
	)"
fi

if ! command -v git >/dev/null; then
	abort "$(
		cat <<EOABORT
You must install Git before installing this Nvim config. See:
  ${tty_underline}https://git-scm.com/${tty_reset}
EOABORT
	)"
fi

if [ ! -d ${DEST_PATH} ]; then
	printf "About to clone spacenvim to ${tty_blue}%s${tty_reset}" "${DEST_PATH}"
	wait_for_user
	execute "git" "clone" ${DEST_URL} ${DEST_PATH}
	echo
fi
cd ${DEST_PATH} || return

PACKER_ROOT="${HOME}/.local/share/nvim/site/pack/packer"
PACKER_PATH="${PACKER_ROOT}/start/packer.nvim"
if [ ! -d ${PACKER_PATH} ]; then
	printf "About to clone wbthomason/packer.nvim to ${tty_blue}%s${tty_reset}" "${PACKER_PATH}"
	wait_for_user
	execute "git" "clone" "https://github.com/wbthomason/packer.nvim" "${PACKER_PATH}"
	echo
fi

cat <<EOS
Now we will open nvim to install plugins, This process may take a long time.
If any plugin installation fails, you MUST re-execute ${tty_blue}:PackerInstall${tty_reset} manually.
EOS
printf "${tty_yellow}Please quit nvim after all plugins are installed successfully${tty_reset}"
wait_for_user
nvim +PackerInstall

echo
read -p "Do you want to use plugins snapshot? This can make nvim more stable (require python3) (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	command -v python3 >/dev/null || { echo "ERROR: cannot find python3"; exit 1; }
	python3 ./hack/snapshot.py rollback
fi

echo
echo "Now we will open nvim to compile plugins"
printf "${tty_yellow}Please quit nvim after plugins compilation done${tty_reset}"
wait_for_user
nvim +PackerCompile

echo
echo "Spacenvim was successfully installed to your machine! Thanks for using."
cd ${BACKUP_DIR}
