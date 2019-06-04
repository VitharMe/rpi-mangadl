FROM arm32v7/alpine

MAINTAINER Vithar Me <vithar@vithar.me>

RUN apk add --no-cache bash curl
COPY dl.sh /dl.sh

CMD ["./dl.sh"]
