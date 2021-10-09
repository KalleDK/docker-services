include ../tools/Makefile.mk

ifndef FOLDER
FOLDER := ServerProd
endif

build: ${BUILD_DIR}/bwenv ${BUILD_DIR}/bwenv.conf

	
${BUILD_DIR}/bwenv.conf: | ${BUILD_DIR}
	echo "{}" > "$@"

${BUILD_DIR}/bwenv: | ${BUILD_DIR}
	@echo downloading bwenv
	wget -L -O "$@" "https://raw.githubusercontent.com/KalleDK/py-bwenv/main/bwenv.py" > /dev/null 2>&1

install:
	install -m 755 ${BUILD_DIR}/bwenv      /usr/local/bin/bwenv
	install -m 644 ${BUILD_DIR}/bwenv.conf /usr/local/etc/bwenv.conf

uninstall:
	rm -f /usr/local/bin/bwenv
	rm -f /usr/local/etc/bwenv.conf

init:
	bwenv init ${FOLDER}
