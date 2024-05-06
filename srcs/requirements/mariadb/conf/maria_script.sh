#! /bin/bash

sed -i 's|bind-address            = 127.0.0.1|bind-address = 0.0.0.0|' /etc/mysql/mariadb.conf.d/50-server.cnf 

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB}"

mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PW}'"

mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USER}'@'%'"

mysql -e "FLUSH PRIVILEGES"

service mariadb stop

exec mysqld_safe