#!/bin/bash

sed -i 's|path_credit|/etc/nginx/ssl/inception.crt|' /etc/nginx/sites-enabled/default

sed -i 's|path_key|/etc/nginx/ssl/inception.key|' /etc/nginx/sites-enabled/default


openssl req -x509 -nodes -out ${CREDIT} -keyout ${CREDIT_KEY} \
    -subj "/C=MA/L=benguerir/O=1337/OU=1337/CN=onaciri.42.fr/UID=onaciri" 

cat /etc/nginx/sites-enabled/default

nginx -g 'daemon off;'