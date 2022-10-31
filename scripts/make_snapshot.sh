#!/bin/bash

set -e

if [ -f snapshot ]; then
	rm snapshot
fi

repos=()

list_repo() {
	if [ ! -d $1 ]; then
		return
	fi
	if [ -d "$1/.git" ]; then
		repos+=("$1")
		return
	fi
	for file in `ls $1`; do
		if [ -d "$1/$file" ]; then
			list_repo "$1/$file"
		fi
	done
}

list_repo $HOME/.local/share/nvim/site/pack/packer

for repo_path in "${repos[@]}"; do
	repo_name=${repo_path#"$HOME/.local/share/nvim/site/pack/packer/"}
	commit_id=`git -C $repo_path rev-parse HEAD`
	remote_url=`git -C $repo_path remote get-url origin`
	echo "$repo_name $remote_url $commit_id" >> snapshot
	echo "Plugin: $remote_url, Commit: $commit_id"
done
