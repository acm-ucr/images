FROM alpine:3.12

COPY entrypoint.sh /entrypoint.sh

RUN apk update && apk add libwebp-tools

ENTRYPOINT ["/entrypoint.sh"]
