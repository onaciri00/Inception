FROM debian:11

RUN apt-get update 

RUN apt-get install -y mariadb-server

COPY ./conf/maria_script /maria_script

#CHECK if chmod should take another parameter

RUN chmod 777 maria_script

EXPOSE 3306

CMD ["./maria_script"]

