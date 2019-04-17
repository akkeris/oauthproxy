FROM golang:1.11-alpine
RUN apk update
RUN apk add bash
RUN apk add ca-certificates git
ADD start.sh .
RUN go get github.com/pusher/oauth2_proxy
RUN chmod +x ./start.sh
CMD ["./start.sh"]


