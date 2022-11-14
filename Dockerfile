FROM golang:1.19.3-alpine3.16

ARG FILE_NAME

RUN apk update
RUN apk add make

WORKDIR /usr/local/app/src

COPY . .

# build
RUN make
RUN mv ${FILE_NAME} ../

WORKDIR /usr/local/app
RUN rm -rf ./src

ENTRYPOINT [ "/usr/local/app/${FILE_NAME}", "-release-mode=release" ]