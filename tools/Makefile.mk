BUILD_DIR := obj
ENV_DIR := env
BWENV := bwenv
SERVICE_DIR := /srv/${SERVICE}

install_pre: 

install_service:

install: install_pre install_service

uninstall_pre:

uninstall_service:

uninstall: uninstall_pre uninstall_service

build_pre:

build_service:

build: build_pre build_service


${BUILD_DIR}:
	mkdir -p $@

${ENV_DIR}:
	mkdir -p $@

clean:
	rm -rf ${BUILD_DIR}
	rm -rf ${ENV_DIR}

${BUILD_DIR}/%.env: | ${BUILD_DIR}
	$(BWENV) get ${SERVICE} -o $@

${ENV_DIR}/%.env: | ${ENV_DIR}
	$(BWENV) get ${SERVICE} -o $@
