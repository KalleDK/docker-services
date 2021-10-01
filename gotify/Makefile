-include build/.env

SRV_PATH=/srv/gotify
DC=docker-compose --project-directory ${SRV_PATH} --file ${SRV_PATH}/docker-compose.yml

.PHONY: build install run uninstall clean

build:
	test -n "${BW_SESSION}" || exit 1
	mkdir -p build
	cd build && bwenv get gotify_prod

install:
	mkdir -p ${SRV_PATH}
	cp docker-compose.yml ${SRV_PATH}/docker-compose.yml
	cp build/.env ${SRV_PATH}/.env
	$(DC) up --no-start

run:
	$(DC) up -d

uninstall:
	$(DC) down -v
	rm -r ${SRV_PATH}

clean:
	rm -r build
