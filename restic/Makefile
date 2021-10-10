SERVICE := restic

include ../tools/Makefile.mk
include ../tools/Makefile.env

${BUILD_DIR}/restic-docker: | ${BUILD_DIR}
	cp restic-docker ${BUILD_DIR}/restic-docker

${BUILD_DIR}/secret: | ${BUILD_DIR}
	@echo Create secret
	@echo "${RESTIC_PASSWORD}" > ${BUILD_DIR}/secret

${BUILD_DIR}/repository: | ${BUILD_DIR}
	@echo Create repository
	@echo "${RESTIC_REPOSITORY}" > ${BUILD_DIR}/repository

build: | ${BUILD_DIR}/restic-docker ${BUILD_DIR}/secret ${BUILD_DIR}/repository

install:
	mkdir -p /usr/local/etc/restic
	install -m 755 ${BUILD_DIR}/restic-docker /usr/local/bin/restic-docker
	install -m 600 ${BUILD_DIR}/repository /usr/local/etc/restic/repository
	install -m 600 ${BUILD_DIR}/secret /usr/local/etc/restic/secret
	
uninstall:
	rm -f /usr/local/bin/restic-docker
	rm -rf /usr/local/etc/restic
