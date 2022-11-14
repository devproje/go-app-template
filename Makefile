TARGET=service
SOURCE=main.go

TAG=default

$(TARGET): $(SOURCE)
	go build -o $(TARGET) $(SOURCE)

debug:
	go run main.go -debug

init:
	go mod tidy

publish:
	./scripts/publish.sh $(TAG)

clean:
	rm $(TARGET)

rmlog:
	rm log.txt