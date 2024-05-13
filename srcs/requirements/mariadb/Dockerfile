FROM debian:11


EXPOSE 3306

RUN apt-get update 

RUN apt-get install -y mariadb-server

COPY ./conf/maria_script.sh /


RUN chmod 777 maria_script.sh

EXPOSE 3306

CMD ["./maria_script.sh"]