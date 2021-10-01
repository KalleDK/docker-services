-include build/.env

build:
	test -n "${BW_SESSION}" || exit 1
	mkdir -p build
	cd build && bwenv get downy_prod

install:
	cat downy.yml | sed "s#\$${HOSTNAME}#${HOSTNAME}#" | sed "s#\$${ENDPOINT}#${ENDPOINT}#" | docker-compose --project-directory /srv/traefik -f /srv/traefik/docker-compose.yml run --rm --entrypoint tee server /conf/services/downy.yml

install_exec:
	cat downy.yml | sed "s#\$${HOSTNAME}#${HOSTNAME}#" | sed "s#\$${ENDPOINT}#${ENDPOINT}#" | docker-compose --project-directory /srv/traefik -f /srv/traefik/docker-compose.yml exec -T server tee /conf/services/downy.yml

clean:
	rm -r build
