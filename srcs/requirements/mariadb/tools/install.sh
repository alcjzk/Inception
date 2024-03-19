#!/bin/sh

apk update
apk upgrade
apk add mysql mysql-client

mv mariadb-server.cnf /etc/my.cnf.d/
mariadb-install-db --skip-test-db
mkdir /run/mysqld/
chown mysql:mysql /run/mysqld
