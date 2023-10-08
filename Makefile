include app.env

start-db:
	docker start postgres16

postgres:
	docker run --name postgres16 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secretpostgres -d postgres:16-alpine

create-db:
	docker exec -it postgres16 createdb --username=root --owner=root gorest

drop-db:
	docker exec -it postgres16 dropdb gorest

run:
	go run ./cmd/api

create-migration:
	migrate create -seq -ext=.sql -dir=./migrations $(MIGRATION_NAME)

migrate-up:
	migrate -path ./migrations -database "$(DB_SOURCE)" up

migrate-down:
	migrate -path ./migrations -database "$(DB_SOURCE)" down

migrate-force:
	migrate -path ./migrations -database "$(DB_SOURCE)" force 1

sqlc:
	sqlc generate