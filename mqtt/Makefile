-include build/.env

SRV_PATH=/srv/mqtt
DC=docker-compose --project-directory ${SRV_PATH} --file ${SRV_PATH}/docker-compose.yml

build:
	test -n "${BW_SESSION}" || exit 1
	mkdir -p build
	cd build && bwenv get mqtt_prod

install:
	mkdir -p ${SRV_PATH}
	cp docker-compose.yml ${SRV_PATH}/docker-compose.yml
	cp build/.env ${SRV_PATH}/.env
	$(DC) up --no-start
	cat mosquitto.conf | $(DC) run --rm --entrypoint tee server /mosquitto/config/mosquitto.conf
	$(DC) run --rm --entrypoint mosquitto_passwd server -b -c /mosquitto/config/passwd ${MQTT_USER} ${MQTT_PASS}

run:
	$(DC) up -d

clean:
	rm -r build
