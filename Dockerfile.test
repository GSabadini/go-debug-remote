# Compile stage
FROM golang:alpine AS build-env

ENV CGO_ENABLED=0 \
    GO111MODULE=on

WORKDIR /build
COPY . .

RUN go mod download
# The -gcflags "all=-N -l" flag helps us get a better debug experience
RUN go build -gcflags "all=-N -l" -o main
# Compile Delve
RUN apk add --no-cache git
RUN go get github.com/go-delve/delve/cmd/dlv

# Final stage
FROM alpine:3.7
# Port 3000 belongs to our application, 40000 belongs to Delve
EXPOSE 3000 40000
# Allow delve to run on Alpine based containers.
RUN apk add --no-cache libc6-compat
WORKDIR /
COPY --from=build-env /build /
COPY --from=build-env /go/bin/dlv /
# Run delve
CMD ["/dlv", "debug", "--listen=:40000", "--headless=true", "--accept-multiclient",  "--api-version=2", "--log", "exec", "/main"]