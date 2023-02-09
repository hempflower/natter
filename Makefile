help:
	@echo "Build:"
	@echo "  make all   - Build all deliverables"
	@echo "  make cmd   - Build the natter CLI tool & Go library"
	@echo "  make clean - Clean build folder"

all: clean proto cmd

clean:
	@echo == Cleaning ==
	rm -rf build
	@echo

proto:
	@echo == Generating protobuf code ==
	protoc --go_out=. internal/*.proto
	@echo

cmd: proto
	@echo == Building natter CLI ==
	mkdir -p build/cmd
	go build -o build/cmd/natter cmd/natter/main.go
	@echo
	@echo "--> natter CLI built at build/cmd/natter"
	@echo


