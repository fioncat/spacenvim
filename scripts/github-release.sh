#!/bin/bash

set -ue

RELEASE_VERSION=${GITHUB_REF#refs/*/}

IFS='-' read -r -a VERS <<< "${RELEASE_VERSION}"
SPACENVIM_VERSION=${VERS[0]}
NEOVIM_VERSION=${VERS[1]}

if [ -z ${NEOVIM_VERSION} ]; then
	echo "invalid release version ${RELEASE_VERSION}"
	exit 1
fi

RELEASE_TITLE="${SPACENVIM_VERSION} for neovim ${NEOVIM_VERSION}"
echo "RELEASE_TITLE=${RELEASE_TITLE}" >> ${GITHUB_ENV}

