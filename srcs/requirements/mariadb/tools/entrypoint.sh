#!/bin/sh

rm -rf /run/mysqld/
mkdir /run/mysqld/
chown mysql:mysql /run/mysqld

if [ ! -d "/var/mysql/mysql" ]; then

echo "Initializing mariadb.."

mariadb-install-db --skip-test-db

mariadbd --bootstrap << EOF
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';
CREATE DATABASE ${DB_WP_DATABASE};
CREATE USER 'docker_healthcheck'@'localhost';
CREATE USER '${DB_WP_USER}'@'%' IDENTIFIED BY '${DB_WP_PASS}';
GRANT ALL PRIVILEGES ON ${DB_WP_DATABASE}.* TO '${DB_WP_USER}'@'%';
EOF

fi

exec mariadbd
