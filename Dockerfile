FROM alpine
MAINTAINER Fabien Potencier <fabien.potencier@gmail.com>

ENV PORT 8707
EXPOSE 8707

RUN apk add --no-cache curl

ADD blackfire blackfire-agent /usr/bin/

CMD ["blackfire-agent", "--socket", "tcp://0.0.0.0:8707", "--config", "/dev/null"]
