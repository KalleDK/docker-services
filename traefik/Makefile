SERVICE := traefik

include ../tools/Makefile.mk
include ../tools/Makefile.env

include ../tools/Makefile.Docker.mk

install:
	$(DC) up --no-start
	$(DC) run --rm --entrypoint mkdir server -p /conf/services
	$(DC) run --rm --entrypoint mkdir server -p /conf/auth
	$(DC) run --rm --entrypoint touch server /conf/auth/htpasswd
	cat auth.yml | $(DC) run --rm --entrypoint tee server /conf/services/auth.yml
	install -m 744 backup_traefik /etc/cron.daily/backup_trafik

install_networks: dnet_inside dnet_outside dnet_mgmt

uninstall_networks: rnet_inside rnet_outside rnet_mgmt
