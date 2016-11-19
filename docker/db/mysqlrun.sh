#!/usr/bin/env bash

set -m
set -e

MYSQL_DB=${MYSQL_DB:-webusers}
MYSQL_USER=${MYSQL_USER:-dbadmin}
MYSQL_PASS=${MYSQL_PASS:-dbpassword}
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-secret}

mysqld_safe &

sleep 10

mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB}"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON ${MYSQL_DB}.* to '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}'"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES"

fg