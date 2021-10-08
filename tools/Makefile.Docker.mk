DC := docker-compose --project-directory ${SERVICE_DIR} -f ${SERVICE_DIR}/docker-compose.yml

${SERVICE_DIR}:
	mkdir -p ${SERVICE_DIR}

${SERVICE_DIR}/docker-compose.yml: ${BUILD_DIR}/docker-compose.yml | ${SERVICE_DIR}
	cp ${BUILD_DIR}/docker-compose.yml ${SERVICE_DIR}/docker-compose.yml

${SERVICE_DIR}/.env: ${BUILD_DIR}/runtime.env | ${SERVICE_DIR}
	cp ${BUILD_DIR}/runtime.env ${SERVICE_DIR}/.env

install_networks:

install_service: install_networks ${SERVICE_DIR}/docker-compose.yml ${SERVICE_DIR}/.env

uninstall_networks:

uninstall_dir:
	rm -rf ${SERVICE_DIR}

uninstall_service: remove uninstall_networks uninstall_dir


${BUILD_DIR}/docker-compose.yml: docker-compose.yml | ${BUILD_DIR}
	cp docker-compose.yml ${BUILD_DIR}/docker-compose.yml

build_service: ${BUILD_DIR}/docker-compose.yml ${BUILD_DIR}/runtime.env

dnet_%:
	docker network create --ipv6 --subnet ${NET_${*}} --gateway ${GW_${*}} ${SERVICE}_${*}

rnet_%:
	docker network rm ${SERVICE}_${*}



logs:
	$(DC) logs

up:
	$(DC) up -d

remove:
	$(DC) down -v
