FROM alpine
MAINTAINER Fabien Potencier <fabien.potencier@gmail.com>

ENV BLACKFIRE_CONFIG /dev/null
ENV BLACKFIRE_LOG_LEVEL 1
ENV BLACKFIRE_SOCKET tcp://0.0.0.0:8707
EXPOSE 8707

RUN apk add --no-cache curl

ADD blackfire blackfire-agent /usr/bin/

CMD ["blackfire-agent"]
