FROM debian:11

RUN apt-get update 

#make sure that you don't need to install a specific version

RUN apt-get  install -y nginx 

RUN apt-get install -y openssl

RUN rm -rf /etc/nginx/sites-enabled/default

COPY ./conf/default /etc/nginx/sites-enabled/default

RUN mkdir -p /etc/nginx/ssl


RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=MA/L=benguerir/O=1337/OU=1337/CN=onaciri.42.fr/UID=onaciri" 

EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]