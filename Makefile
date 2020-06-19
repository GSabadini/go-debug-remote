#!make

docker-build:
	docker build --rm -t gsabadini/go-lang-dev:1.14 .

docker-run:
	docker run --rm -it -p 3000:3000 -p 40000:40000 --security-opt=seccomp:unconfined gsabadini/go-lang-dev:1.14

up:
	docker-compose up -d

down:
	docker-compose down --remove-orphans