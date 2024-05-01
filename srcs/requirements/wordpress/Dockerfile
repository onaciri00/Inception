FROM debian:11

RUN apt-get update 

RUN apt-get  install -y  php-fpm php-mysql

RUN apt-get install -y curl

#create script to install and configure Wowrdprees 
COPY ./extra/script.sh /
#see whta php need to be run.

