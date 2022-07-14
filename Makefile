PREFIX = /usr
FLAGS =

all: options doc-search

options:
	@echo doc-search build options:
	@echo "Build flags = ${FLAGS}"

clean:
	cargo clean

doc-search:
	cargo build --release ${FLAGS}

install: all
	mkdir -p ${PREFIX}/bin
	cp -f target/release/doc-search ${PREFIX}/bin
	chmod 755 ${PREFIX}/bin/doc-search

uninstall:
	rm -f ${PREFIX}/bin/doc-search

.PHONY: all options doc-search install uninstall
