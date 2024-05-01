#! /bin/bash

curl -O https://wordpress.org/wordpress-6.5.2.tar.gz

tar -xzvf wordpress-6.5.2.tar.gz

#can cause trouble 
mv wordpress/* /var/www/html/

rm wordpress-6.5.2.tar.gz

