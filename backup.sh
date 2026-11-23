#!/bin/bash
set -e

ENV_FILE="./.env"
BACKUP_DIR="/opt/backup"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${MYSQL_DATABASE}_${TIMESTAMP}.sql"

docker run --rm \
  --entrypoint "" \
  --network shvirtd-example-python_backend \
  -v "${BACKUP_DIR}:/backup" \
  schnitzler/mysqldump \
  mysqldump --opt --no-tablespaces -h db -u "${MYSQL_USER}" -p"${MYSQL_PASSWORD}" \
  --result-file="/backup/${BACKUP_FILE}" "${MYSQL_DATABASE}"
