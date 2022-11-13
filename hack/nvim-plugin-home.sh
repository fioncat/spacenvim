#!/bin/bash

nvim-plugin-home() {
	TAR_HOME=$(python3 ${HOME}/.config/nvim/hack/snapshot.py home)
	cd ${TAR_HOME}
}
