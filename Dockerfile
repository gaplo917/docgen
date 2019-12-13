FROM golang:1.13
WORKDIR /go/src/app
COPY . .
RUN go get -d -v .
RUN go generate
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o ./bin/docgen .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/app/bin/docgen /bin
CMD ["docgen"]
