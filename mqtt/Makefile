SERVICE := mqtt

include ../tools/Makefile.mk
include ../tools/Makefile.env

include ../tools/Makefile.Docker.mk

install:
	install -m 744 backup_mqtt /etc/cron.daily/backup_mqtt
	$(DC) up --no-start

init:
	cat mosquitto.conf | $(DC) run --rm --entrypoint tee server /mosquitto/config/mosquitto.conf
	$(DC) run --rm --entrypoint mosquitto_passwd server -b -c /mosquitto/config/passwd ${MQTT_USER} ${MQTT_PASS}
