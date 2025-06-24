.PHONY: build

export HOST=localhost
export DBPORT=5432
export USER=root
export PASSWORD=root
export DBNAME=root

lint:
#	time docker run --rm -itv $(pwd):/app -w /app golangci/golangci-lint golangci-lint run controllers/ database/ models/ routes/
	time docker run --rm -itv $(CURDIR):/app -w /app golangci/golangci-lint golangci-lint run controllers/ database/ models/ routes/

test-docker:
	docker compose exec app go test main_test.go
	@date

ci-prepare:
	@clear
	@date

start:
	docker compose up -d

stop:
	docker compose down

ci: ci-prepare start lint test-docker
	@date

build:
	@clear
	@date
	go build .
	@date

test:
	@clear
	@date
	go test -v main_test.go
	@date

run:
	@clear
	@date
	go run main.go
	@date
