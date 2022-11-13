.PHONY: rollback
rollback:
	@python3 ./hack/snapshot.py rollback

.PHONY: fetch-rollback
fetch-rollback:
	@python3 ./hack/snapshot.py fetch-rollback

.PHONY: update
update:
	@python3 ./hack/snapshot.py update

.PHONY: check-update
check-update:
	@python3 ./hack/snapshot.py check-update

.PHONY: build-snapshot
build-snapshot:
	@python3 ./hack/snapshot.py build

.PHONY: clean
clean:
	@rm -f ./plugin/packer_compiled.lua
	@rm -rf ${HOME}/.local/share/nvim/site/pack/packer

.PHONY: fmt
fmt:
	@stylua -g '*.lua' -g '!*_compiled.lua' --config-path=./.github/stylua.toml -- .
