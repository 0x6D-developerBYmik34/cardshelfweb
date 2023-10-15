docker_build:
	docker build -t registry.computernetthings.ru/parallel/frontend:latest . && docker image prune -f

docker_push:
	docker push registry.computernetthings.ru/parallel/frontend:latest
