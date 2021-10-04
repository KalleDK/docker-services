SERVICE := downy

include ../tools/Makefile.mk
include ../tools/Makefile.env

DC := docker-compose --project-directory /srv/traefik -f /srv/traefik/docker-compose.yml

install:
	cat downy.yml | sed "s#\$${HOSTNAME}#${HOSTNAME}#" | sed "s#\$${ENDPOINT}#${ENDPOINT}#" | $(DC) run --rm --entrypoint tee server /conf/services/downy.yml

install_exec:
	cat downy.yml | sed "s#\$${HOSTNAME}#${HOSTNAME}#" | sed "s#\$${ENDPOINT}#${ENDPOINT}#" | $(DC) exec -T server tee /conf/services/downy.yml
