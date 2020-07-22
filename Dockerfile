FROM golang:1.14-stretch
# FROM golang:1.14-alpine

RUN go get github.com/go-delve/delve/cmd/dlv
RUN go get -u github.com/moshebe/gebug

WORKDIR /app
COPY . .

RUN go mod download

#RUN go get github.com/cespare/reflex
#COPY reflex.conf /
RUN go get github.com/pilu/fresh
COPY runner.conf /

EXPOSE 3000 40000

COPY start.sh /

RUN ["chmod", "+x", "/start.sh"]
CMD ["/start.sh"]