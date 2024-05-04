all:
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build

down :
	sudo docker compose -f ./srcs/docker-compose.yml down -v

fdown :
	sudo docker compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf  /home/onaciri/data/wordpress/*
	sudo rm -rf  /home/onaciri/data/mariadb/*

re	: down all