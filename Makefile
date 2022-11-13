all: install

.PHONY: install
install:
	@bash ./scripts/install.sh

.PHONY: rollback
rollback:
	@rm -f ./plugin/packer_compiled.lua
	@git pull
	@nvim +"PackerInstall"
	@python3 ./hack/rollback-snapshot.py
	@nvim +"PackerCompile"

.PHONY: upgrade
upgrade:
	@rm -f ./plugin/packer_compiled.lua
	@git pull
	@nvim +"PackerUpdate"
	@python3 ./hack/rollback-snapshot.py
	@nvim +"PackerCompile"

.PHONY: build-snapshot
build-snapshot:
	@python3 ./hack/build-snapshot.py

.PHONY: clean
clean:
	@rm -f ./plugin/packer_compiled.lua
	@rm -rf ${HOME}/.local/share/nvim/site/pack/packer

.PHONY: fmt
fmt:
	@stylua -g '*.lua' -g '!*_compiled.lua' --config-path=./.github/stylua.toml -- .
