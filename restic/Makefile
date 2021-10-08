SERVICE := restic

include ../tools/Makefile.mk
include ../tools/Makefile.env

include ../tools/Makefile.Docker.mk

${BUILD_DIR}/restic-docker: | ${BUILD_DIR}
	sed "s#SERVICE_DIR#${SERVICE_DIR}#" restic-docker > ${BUILD_DIR}/restic-docker

build: ${BUILD_DIR}/restic-docker 

install:
	install -m 755 ${BUILD_DIR}/restic-docker /usr/local/bin/restic-docker

