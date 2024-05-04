FROM debian:11


EXPOSE 3306

RUN apt-get update 

RUN apt-get install -y mariadb-server

COPY ./conf/maria_script.sh /

#CHECK if chmod should take another parameter

RUN chmod 777 maria_script.sh

EXPOSE 3306

CMD ["sh", "maria_script.sh"]