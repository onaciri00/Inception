FROM debian:11

RUN apt-get update 
RUN apt-get install -y curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN apt-get update -y && apt-get install -y php7.4 php7.4-fpm  php7.4-mysql  mariadb-client 


COPY ./extra/script.sh /

RUN chmod 777 script.sh

EXPOSE 9000

CMD ["./script.sh"]