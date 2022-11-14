TARGET=service
SOURCE=main.go

TAG=default

$(TARGET): $(SOURCE)
	go build -o $(TARGET) $(SOURCE)

debug:
	go run main.go -debug

init:
	go mod tidy

docker:
	docker-compose build --no-cache --build-arg	FILE_NAME="$(TARGET)"

publish:
	./scripts/publish.sh $(TAG)

clean:
	rm $(TARGET)

rmlog:
	rm log.txt