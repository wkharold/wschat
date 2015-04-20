FROM golang:1.4.2

RUN mkdir -p /go/src/github.com/HonestDollar/abe

COPY . /go/src/github.com/HonestDollar/abe
WORKDIR /go/src/github.com/HonestDollar/abe

RUN go get github.com/tools/godep
RUN godep go install ./...

RUN go get github.com/gorilla/websocket
RUN go get github.com/tools/godep

WORKDIR /go/src/github.com/gorilla/websocket/examples/chat
RUN go install ./...

ENTRYPOINT ["/go/bin/chat"]
