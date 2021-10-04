SERVICE := mqtt

include ../tools/Makefile.mk
include ${ENV_DIR}/runtime.env

include ../tools/Makefile.Docker.mk

install:
	$(DC) up --no-start
	cat mosquitto.conf | $(DC) run --rm --entrypoint tee server /mosquitto/config/mosquitto.conf
	$(DC) run --rm --entrypoint mosquitto_passwd server -b -c /mosquitto/config/passwd ${MQTT_USER} ${MQTT_PASS}
