# BUILD-USING:    docker build -t firefightio/chatroom .
# TEST-USING:     docker run --rm -i -t -p 9000:9000 -h chatroom -v $(pwd):/gopath/src/chatroom/ --name=chatroom-dev --entrypoint=/bin/bash firefightio/chatroom -s
# RUN-USING:      docker run --rm -P -h chatroom --name=chatroom firefightio/chatroom

FROM google/golang

WORKDIR /gopath/src/chatroom
ADD . /gopath/src/chatroom/
RUN go get github.com/revel/revel
RUN go get github.com/revel/cmd/revel

ENTRYPOINT ["revel", "run", "chatroom"]
