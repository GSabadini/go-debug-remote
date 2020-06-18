FROM golang:1.14-stretch

RUN go get github.com/go-delve/delve/cmd/dlv
WORKDIR /app

COPY . .

RUN go mod download
RUN go get github.com/cespare/reflex

COPY reflex.conf /

EXPOSE 3000 40000

COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]