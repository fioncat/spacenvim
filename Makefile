all: install

.PHONY: install
install:
	@bash ./scripts/install.sh

.PHONY: sync
sync:
	@rm -f ./plugin/packer_compiled.lua
	@git pull
	@nvim +"PackerInstall"
	@python3 ./scripts/snapshot/rollback.py
	@nvim +"PackerCompile"

.PHONY: snapshot
snapshot:
	@python3 ./scripts/snapshot/build.py

.PHONY: clean
clean:
	@rm -f ./plugin/packer_compiled.lua
	@rm -rf ${HOME}/.local/share/nvim/site/pack/packer

.PHONY: fmt
fmt:
	@stylua -g '*.lua' -g '!*_compiled.lua' --config-path=./.github/stylua.toml -- .
