#!/bin/sh

ls run
rm -rf /run/mysqld/
ls run
mkdir /run/mysqld/
chown mysql:mysql /run/mysqld

if [ ! -d "/var/mysql/mysql" ]; then

mariadb-install-db --skip-test-db

fi

if [ ! -d "/var/mysql/${DB_WP_DATABASE}" ]; then

echo "Initializing mariadb.."

mariadbd --bootstrap << EOF
FLUSH PRIVILEGES;
CREATE DATABASE ${DB_WP_DATABASE};
CREATE USER '${DB_WP_USER}'@'%' IDENTIFIED BY '${DB_WP_PASS}';
GRANT ALL PRIVILEGES ON ${DB_WP_DATABASE}.* TO '${DB_WP_USER}'@'%';
EOF

fi

exec mariadbd
