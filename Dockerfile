FROM alpine
MAINTAINER Fabien Potencier <fabien.potencier@gmail.com>

RUN apk add --no-cache ca-certificates

ENV BLACKFIRE_VERSION 1.7.3
ENV BLACKFIRE_LOG_LEVEL 1
ENV BLACKFIRE_SOCKET tcp://0.0.0.0:8707
ENV BLACKFIRE_CONFIG /dev/null

ADD https://packages.blackfire.io/binaries/blackfire-agent/${BLACKFIRE_VERSION}/blackfire-cli-linux_static_amd64 /usr/bin/blackfire
ADD https://packages.blackfire.io/binaries/blackfire-agent/${BLACKFIRE_VERSION}/blackfire-agent-linux_static_amd64 /usr/bin/blackfire-agent
RUN chmod +x /usr/bin/blackfire /usr/bin/blackfire-agent

EXPOSE 8707

ENTRYPOINT ["blackfire-agent"]
