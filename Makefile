COMPOSE_FILE = ./srcs/docker-compose.yml
ENV_FILE = ./srcs/.env

.PHONY: all build up down stop rm rebuild

all: build up

build:
	docker-compose --file $(COMPOSE_FILE) --env-file $(ENV_FILE) build

up:
	docker-compose --file $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d

down:
	docker-compose --file $(COMPOSE_FILE) --env-file $(ENV_FILE) down

stop:
	docker-compose --file $(COMPOSE_FILE) --env-file $(ENV_FILE) stop
rm-volume:
	docker volume prune -f
rm: stop
	docker-compose --file $(COMPOSE_FILE) --env-file $(ENV_FILE) rm -f

rebuild: rm build up
