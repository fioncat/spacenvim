#!/bin/bash

nvim-plugin-home() {
	TAR_HOME=$(python3 ${HOME}/.config/nvim/hack/home.py)
	cd ${TAR_HOME}
}
