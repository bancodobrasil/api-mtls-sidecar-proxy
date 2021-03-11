FROM golang:1.14.3-alpine3.11 AS BUILD

ENV LOG_LEVEL 'info'

WORKDIR /app

ADD /go.mod /app/
ADD /go.sum /app/

RUN go mod download

ADD main.go /app/

RUN go build -o /bin/demo
RUN chmod +x /bin/demo

CMD [ "/bin/demo" ]
