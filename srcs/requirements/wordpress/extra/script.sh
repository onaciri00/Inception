#!/bin/bash


sleep 10

chmod 777 wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

mkdir /var/www/html/wordpress


mkdir -p /run/php


cd /var/www/html/wordpress

wp core download --allow-root


wp core config --dbname=${MYSQL_DB} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PW} --dbhost=mariadb --allow-root

wp core install --allow-root --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${WP_USER} --admin_password=${WP_PW} --admin_email=${WP_EMAIL}


wp user create --allow-root ${WP_USER_NAME} ${WP_USER_EMAIL} --user_pass="${WP_USER_PASSWORD}"

chown -R www-data:www-data /var/www/html/wordpress

sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf

sed -i 's|chdir = /var/www|chdir = /var/www/html/wordpress|g' /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4  -F