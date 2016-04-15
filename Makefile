BUILD_FLAGS :=  "-X main.BuildStamp=`date -u '+%Y-%m-%d_%I:%M:%S%p'` -X main.GitVersion=`git rev-parse HEAD`"

default: clean build

linux-binary:
		GO15VENDOREXPERIMENT=1 CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags $(BUILD_FLAGS) -o builds/linux/letsencrypt-responder

build:
		GO15VENDOREXPERIMENT=1 go build -a -ldflags $(BUILD_FLAGS) -o letsencrypt-responder

clean:
		rm -f kumoru
		rm -f builds/linux/letsencrypt-responder

restore:
		GO15VENDOREXPERIMENT=1 godep restore

test:
		GO15VENDOREXPERIMENT=1 go test -cover ./...

release: clean test linux-binary
