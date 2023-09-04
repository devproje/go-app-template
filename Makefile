OUTPUT=service
SOURCES=src/*.go src/**/*.go
MAIN=src/main.go

TAG=default

all: $(OUTPUT)

$(OUTPUT): $(SOURCES)
	go build -o $^ $(MAIN)

debug:
	go run main.go -debug

publish:
	./scripts/publish.sh $(TAG)

clean:
	rm $(TARGET)
	rm log.txt
