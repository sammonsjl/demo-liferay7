#!/bin/sh
set -e

if [[ ! -d "/storage/backups/liferay" ]]; then
    mkdir -p /storage/backups/liferay
fi

if [[ ! -d "/storage/backups/mariadb" ]]; then
    mkdir -p /storage/backups/mariadb
fi

if [ "${CRON}" ]; then
    exec go-cron -s "${CRON}" -- /bin/sh -c "$@"
else
    exec "$@"
fi
