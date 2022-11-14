#!/bin/bash

# Donot allow undefined variables
set -u

if [[ -t 1 ]]; then
	tty_escape() { printf "\033[%sm" "$1"; }
else
	tty_escape() { :; }
fi

tty_yellow="$(tty_escape "0;33")"
tty_blue="$(tty_escape "0;34")"
tty_red="$(tty_escape "0;31")"
tty_cyan="$(tty_escape "0;36")"
tty_reset="$(tty_escape 0)"

on_error() {
	printf "${tty_red}failed:${tty_reset} $@\n" >&2
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

execute "git" "status"

