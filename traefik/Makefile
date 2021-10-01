.PHONY: install build uninstall run logs

-include build/.env

build:
	test -n "${BW_SESSION}" || exit 1
	mkdir -p build
	cd build && bwenv get traefik_prod

logs:
	docker-compose --project-directory /srv/traefik logs

run:
	docker-compose --project-directory /srv/traefik up -d

install:
	mkdir -p /srv/traefik
	cp docker-compose.yml /srv/traefik/docker-compose.yml
	cp build/.env /srv/traefik/.env
	docker network create --ipv6 --subnet ${NET_OUTSIDE} --gateway ${GW_OUTSIDE} traefik_outside
	docker network create --ipv6 --subnet ${NET_MGMT} --gateway ${GW_MGMT} traefik_mgmt
	docker network create --ipv6 --subnet ${NET_INSIDE} --gateway ${GW_INSIDE} traefik_inside
	docker-compose --project-directory /srv/traefik up --no-start
	docker-compose --project-directory /srv/traefik run --rm --entrypoint mkdir server -p /conf/services
	docker-compose --project-directory /srv/traefik run --rm --entrypoint mkdir server -p /conf/auth
	docker-compose --project-directory /srv/traefik run --rm --entrypoint touch server /conf/auth/htpasswd
	cat auth.yml | docker-compose --project-directory /srv/traefik run --rm --entrypoint tee server /conf/services/auth.yml

uninstall:
	docker-compose --project-directory /srv/traefik down -v
	docker network rm traefik_outside
	docker network rm traefik_inside
	docker network rm traefik_mgmt
	rm -r /srv/traefik


clean:
	rm -rf build
