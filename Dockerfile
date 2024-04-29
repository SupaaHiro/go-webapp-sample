FROM golang:1.22.2
EXPOSE 8080

ENTRYPOINT ['go', 'run main.go']