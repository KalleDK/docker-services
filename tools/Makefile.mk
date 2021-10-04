BUILD_DIR := obj
BW_CONF := /usr/local/etc/bwenv.json
BWENV := bwenv --config ${BW_CONF}

install_custom: 

install: install_custom
	echo install

${BUILD_DIR}:
	mkdir -p ${BUILD_DIR}

build/docker-compose.yml: gen
	cp docker-compose.yml ${BUILD_DIR}/docker-compose.yml


clean:
	rm -rf ${BUILD_DIR}
	rm -f ${FORCE_FILE}

FORCE_FILE := .force

${FORCE_FILE}:
	@touch ${FORCE_FILE}

.PHONY: force
force:
	@touch ${FORCE_FILE}
