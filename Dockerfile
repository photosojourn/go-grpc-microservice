FROM golang:1.13-alpine AS build

#Install git
RUN apk add --no-cache git
RUN go get github.com/photosojourn/go-grpc-microservice
WORKDIR /go/src/github.com/photosojourn/go-grpc-microservice
RUN go build -o /bin/go-grpc-microservice

FROM golang:1.13-alpine
COPY --from=build /bin/go-grpc-microservice /bin/go-grpc-microservice
EXPOSE 8080
ENTRYPOINT ["/bin/go-json-microservice"]
