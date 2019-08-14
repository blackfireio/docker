FROM alpine
MAINTAINER Fabien Potencier <fabien.potencier@gmail.com>

ENV BLACKFIRE_CONFIG /dev/null
ENV BLACKFIRE_LOG_LEVEL 1
ENV BLACKFIRE_SOCKET tcp://0.0.0.0:8707
EXPOSE 8707

RUN apk add --no-cache curl

COPY blackfire blackfire-agent /usr/local/bin/

# Don't run as root
RUN addgroup -S blackfire && adduser -S -H -G blackfire -u 999 blackfire
USER blackfire

CMD ["blackfire-agent"]
