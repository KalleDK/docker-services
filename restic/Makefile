SERVICE := restic

include ../tools/Makefile.mk
include ../tools/Makefile.env

include ../tools/Makefile.Docker.mk

${BUILD_DIR}/restic-docker: | ${BUILD_DIR}
	sed "s#SERVICE_DIR#${SERVICE_DIR}#g" restic-docker > ${BUILD_DIR}/restic-docker

${BUILD_DIR}/entrypoint.sh: | ${BUILD_DIR}
	cp entrypoint.sh "$@"

build: ${BUILD_DIR}/restic-docker ${BUILD_DIR}/entrypoint.sh

install:
	install -m 755 ${BUILD_DIR}/restic-docker /usr/local/bin/restic-docker
	install -m 755 ${BUILD_DIR}/entrypoint.sh ${SERVICE_DIR}/entrypoint.sh

