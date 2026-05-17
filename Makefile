# -------------------------------------------------
# TO BUILD AND RUN REST_API LOCALLY

build-l:
	pytest -v

run-l:
	python app.py   #db schema migration happens here

# -------------------------------------------------
# FOR CONTAINERIZE REST_API

build-c:
	docker build -t student-api:1.0.0 .

run-c:
	docker run --name student-api -p 5000:5000 student-api:1.0.0

# -------------------------------------------------
# FOR BOTH CONTAINER START AND CONNECT LOCALLY

start-db:
	docker compose up -d db

build-img:
	docker compose build

start-api:
	docker compose up -d student-api

migrate-db:
	docker exec student-db psql -U postgres -d students -c "\dt"
#	creates tables in db

run-all:
	make start-db
	sleep 5      #stops 5 secs
	make build-img
	make start-api
	sleep 5  
	make migrate-db

stop-all:
	docker compose down

# -------------------------------------------------
# FOR CI PIPELINE

install:
	pip install -r requirements.txt

codechecks:
	flake8 ./REST_API/
#	to run the code quality, formatting checks

tests:
	pytest -v

build:
	docker build -t ${DOCKER_USERNAME}/student-api:1.0.1 .

docker-login:
	echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
#	"--password-stdin" read password from input stream

push:
	docker push ${DOCKER_USERNAME}/student-api:1.0.1

# -------------------------------------------------
# FOR VAGRANT BOX SETUP

run-vm:
	docker compose -f dockercompose-VM.yml up -d
# 	container runs in detach mode

stop-vm:
	docker compose -f dockercompose-VM.yml down

