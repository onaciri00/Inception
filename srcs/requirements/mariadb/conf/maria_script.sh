#! /bin/bash

sed -i 's|bind-address            = 127.0.0.1|bind-address = 0.0.0.0|' /etc/mysql/mariadb.conf.d/50-server.cnf 

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS mydatabase"

mysql -e "CREATE USER IF NOT EXISTS 'myuser'@'%' IDENTIFIED BY 'mypassword'"

mysql -e "GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'%'"

mysql -e "FLUSH PRIVILEGES"

service mariadb stop

exec mysqld_safe