FROM alpine:3.7

MAINTAINER aleksey.kolyadin@isobar.ru

RUN apk add --no-cache poppler-utils

RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

RUN mkdir /var/workdir && chown www-data:www-data /var/workdir

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

USER www-data
WORKDIR /var/workdir

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]