include ../tools/Makefile.mk

build: ${BUILD_DIR}/bwenv ${BUILD_DIR}/bwenv.json

	
${BUILD_DIR}/bwenv.json: ${BUILD_DIR}/bwenv
ifdef FOLDER
	${BUILD_DIR}/bwenv --config ./obj/bwenv.json init ${FOLDER}
else
	@echo -n "Bitwarden Folder: "; \
	read FOLDER; \
	${BUILD_DIR}/bwenv --config ./obj/bwenv.json init $${FOLDER}
endif


${BUILD_DIR}/bwenv: ${BUILD_DIR}
	wget -L -O "$@" "https://raw.githubusercontent.com/KalleDK/py-bwenv/main/bwenv.py"
	sed -i 's#default="bwenv.json"#default="/usr/local/etc/bwenv.json"#' "$@"
	chmod +x "$@"

install:
	cp ${BUILD_DIR}/bwenv /usr/local/bin/bwenv
	chmod +x /usr/local/bin/bwenv
	cp ${BUILD_DIR}/bwenv.json ${BW_CONF}

