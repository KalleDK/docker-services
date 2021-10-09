#!/usr/bin/env sh

ACTION=$1
shift;

HOST=$(hostname)

if [ "${ACTION}" = "backup" ]; then
        restic backup --host ${HOST} --tag ${SERVICE} --tag docker "$@" /vol/${VOLUME}
elif [ "${ACTION}" = "restore" ]; then
        restic restore --host ${HOST} --path /vol/${VOLUME} --target / "$@" latest
fi;
