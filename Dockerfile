# Use official Golang image for build
FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY . .

RUN go build -o server main.go

# Use minimal image for running
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/server .

EXPOSE 8080

CMD ["./server"]
