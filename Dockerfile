FROM golang:alpine as builder
RUN apk add build-base
COPY . /code
WORKDIR /code

RUN go mod init github.com/roli123/jenkins-pipeline-tutorial.git
# Run unit tests
RUN go test

# Build app
RUN go build -o sample-app

FROM alpine

COPY --from=builder /code/sample-app /sample-app
CMD /sample-app
