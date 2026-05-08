# -------------------------------------------------
# FOR BOTH CONTAINER START AND CONNECT

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

# -------------------------------------------------
# FOR CI PIPELINE

install:
	pip install -r requirements.txt

tests:
	pytest -v

codechecks:
	flake8 ./REST_API/  #to find bugs, errors and syntatical errors.

build:
	docker build -t ${DOCKER_USERNAME}/student-api:1.0.0 .

docker-login:
	echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
	#"--password-stdin" read password from input stream

push:
	docker push ${DOCKER_USERNAME}/student-api:1.0.0

