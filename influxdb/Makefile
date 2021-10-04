SERVICE := influxdb

include ../tools/Makefile.mk
include ../tools/Makefile.env

include ../tools/Makefile.Docker.mk

install:
	@echo "Run 'make up' and then 'make init' after 10-20 sec"


init:
	$(DC) exec server influx setup --username ${USERNAME} --password ${PASSWORD} --org ${ORGANIZATION} --bucket ${BUCKET} --retention 0 --force
