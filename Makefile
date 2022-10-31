all: install

.PHONY: install
install:
	@bash ./scripts/install.sh

.PHONY: snapshot
snapshot:
	@bash ./scripts/make_snapshot.sh

