all: install

.PHONY: install
install:
	@bash ./scripts/install.sh

.PHONY: upgrade
upgrade:
	@bash ./scripts/upgrade.sh

.PHONY: snapshot
snapshot:
	@bash ./scripts/make_snapshot.sh

.PHONY: clean
clean:
	@rm -rf plugin
	@rm -rf ${HOME}/.local/share/nvim/site/pack/packer
