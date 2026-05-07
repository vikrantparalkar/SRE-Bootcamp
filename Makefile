start-db:
	docker compose up -d db

build:
	docker compose build

start-api:
	docker compose up -d student-api

migrate-db:
	docker exec student-db psql -U postgres -d students -c "\dt"

run-all:
	make start-db
	sleep 5      #stops 5 secs
	make build
	make start-api
	sleep 5  
	make migrate-db

stop-all:
	docker compose down