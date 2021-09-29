ifneq (,$(wildcard ./.env))
	include .env
	export
	ENV_FILE_PARAM = --env-file .env
endif

build:
	docker-compose up --build -d --remove-orphans

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs

migrate:
	docker-compose exec api python3 manage.py migrate --noinput

makemigrations:
	docker-compose exec api python3 manage.py makemigrations

createsuperuser:
	docker-compose exec api python3 manage.py createsuperuser

down-v:
	docker-compose down -v

# Name of the current folder + volume defined on docker-compose
volume:
	docker volume inspect geodjango-starter_postgres_data

shell:
	docker-compose exec api python3 manage.py shell


