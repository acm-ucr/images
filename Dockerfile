FROM alpine:3.10

RUN apk update && apk add libwebp-tools && apk add openssl
RUN wget https://github.com/cli/cli/releases/download/v1.0.0/gh_1.0.0_linux_386.tar.gz -O ghcli.tar.gz
RUN tar --strip-components=1 -xf ghcli.tar.gz
RUN apk add git 

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
