.PHONY: install build uninstall

SERVICE := traefik

include ../tools/Makefile.mk
include ../tools/Makefile.Docker.mk
include ${ENV_DIR}/runtime.env

install: install_networks
	$(DC) up --no-start
	$(DC) run --rm --entrypoint mkdir server -p /conf/services
	$(DC) run --rm --entrypoint mkdir server -p /conf/auth
	$(DC) run --rm --entrypoint touch server /conf/auth/htpasswd
	cat auth.yml | $(DC) run --rm --entrypoint tee server /conf/services/auth.yml

install_networks: dnet_inside dnet_outside dnet_mgmt

uninstall_networks: rnet_inside rnet_outside rnet_mgmt
