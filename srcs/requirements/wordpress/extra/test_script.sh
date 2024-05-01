#! /bin/bash

curl -O https://wordpress.org/wordpress-6.5.2.tar.gz


tar -xzvf wordpress-6.5.2.tar.gz

mkdir -p /var/www/html/wordpress

#can cause trouble 
mv wordpress/* /var/www/html/wordpress

rm wordpress-6.5.2.tar.gz

cd /var/www/html/wordpress
