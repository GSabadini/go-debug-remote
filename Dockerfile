FROM golang:1.14-stretch
# FROM golang:1.14-alpine

RUN go get github.com/go-delve/delve/cmd/dlv

WORKDIR /app
COPY . .

RUN go mod download && go mod vendor

#RUN go get github.com/pilu/fresh
RUN go get github.com/cespare/reflex
COPY reflex.conf /

EXPOSE 3000 40000

#COPY runner.conf /
COPY start.sh /

RUN ["chmod", "+x", "/start.sh"]
CMD ["/start.sh"]