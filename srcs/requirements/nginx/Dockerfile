FROM debian:11

RUN apt-get update 

RUN apt-get  install -y nginx 

RUN apt-get install -y openssl

RUN rm -rf /etc/nginx/sites-enabled/default

COPY ./conf/default /etc/nginx/sites-enabled/default

COPY ./tools/nginx.sh /

RUN chmod 777 nginx.sh

RUN mkdir -p /etc/nginx/ssl


EXPOSE 443


CMD ["sh", "nginx.sh"]