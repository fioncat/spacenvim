.PHONY: check-gitflow create-snapshot recover-snapshot

check-gitflow:
	@command -v gitflow >/dev/null || { echo "ERROR: gitflow not installed"; exit 1; }

create-snapshot: check-gitflow
	@gitflow create snapshot ${HOME}/.local/share/nvim/site/pack/packer -f snapshot.yaml

recover-snapshot: check-gitflow
	@gitflow sync snapshot ${HOME}/.local/share/nvim/site/pack/packer -f snapshot.yaml
