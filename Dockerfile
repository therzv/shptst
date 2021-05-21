# Build Stage
FROM golang:alpine AS build-env
RUN apk --no-cache add build-base git mercurial gcc
ADD . /build
RUN cd /build && go build main.go 

# Final Stage
FROM alpine
WORKDIR /app
COPY --from=build-env /build/ /app/
EXPOSE 80
ENTRYPOINT ./main
