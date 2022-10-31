#!/bin/bash

set -e

while IFS= read -r line; do
	tmp=(${line//;/ })
	name=${tmp[0]}
	clone_url=${tmp[1]}
	commit_id=${tmp[2]}

	plugin_path=$HOME/.local/share/nvim/site/pack/packer/$name
	if [ -d $plugin_path ]; then
		echo "$plugin_path -> $commit_id"
		git -C $plugin_path checkout $commit_id
	else
		echo "cloning $clone_url to $plugin_path"
		git clone $clone_url $plugin_path
		git -C $plugin_path checkout $commit_id
	fi
done < "snapshot"
