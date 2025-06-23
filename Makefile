.PHONY: build

export HOST=localhost
export DBPORT=5432
export USER=root
export PASSWORD=root
export DBNAME=root

lint:
	@clear
	@date
	time docker run --rm -itv $(pwd):/app -w /app golangci/golangci-lint golangci-lint run controllers/ database/ models/ routes/
	@date

test-docker:
	@clear
	@date
	dockert compose exec app go test main_teste.go
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
