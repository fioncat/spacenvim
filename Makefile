.PHONY: fmt
fmt:
	@stylua -g '*.lua' -g '!*_compiled.lua' --config-path=./.github/stylua.toml -- .
