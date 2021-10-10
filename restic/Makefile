SERVICE := restic

include ../tools/Makefile.mk
include ../tools/Makefile.env

${BUILD_DIR}/restic-docker: | ${BUILD_DIR}
	cp restic-docker ${BUILD_DIR}/restic-docker

${BUILD_DIR}/restic.sh: | ${BUILD_DIR}
	cp profile_restic.sh ${BUILD_DIR}/restic.sh

${BUILD_DIR}/secret: | ${BUILD_DIR}
	@echo Create secret
	@echo "${RESTIC_PASSWORD}" > ${BUILD_DIR}/secret

${BUILD_DIR}/repository: | ${BUILD_DIR}
	@echo Create repository
	@echo "${RESTIC_REPOSITORY}" > ${BUILD_DIR}/repository

build: | ${BUILD_DIR}/restic-docker ${BUILD_DIR}/secret ${BUILD_DIR}/repository ${BUILD_DIR}/restic.sh

install_files:
	mkdir -p /usr/local/etc/restic
	install -m 755 ${BUILD_DIR}/restic-docker /usr/local/bin/restic-docker
	install -m 600 ${BUILD_DIR}/repository /usr/local/etc/restic/repository
	install -m 600 ${BUILD_DIR}/secret /usr/local/etc/restic/secret
	install -m 755 ${BUILD_DIR}/restic.sh /etc/profile.d/restic.sh

install_alias:
	@echo ""
	@echo Run:
	@echo echo \"alias restic=\'sudo -i restic\'\" \>\> ~/.bash_alias
	@echo ""

install: install_files install_alias

	
uninstall:
	rm -f /usr/local/bin/restic-docker
	rm -rf /usr/local/etc/restic
	rm -f /etc/profile.d/restic.sh
