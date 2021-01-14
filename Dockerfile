FROM alpine

ENV BLACKFIRE_CONFIG /dev/null
ENV BLACKFIRE_LOG_LEVEL 1
ENV BLACKFIRE_SOCKET tcp://0.0.0.0:8307
EXPOSE 8307

RUN apk add --no-cache curl socat

COPY blackfire /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/

# Don't run as root
RUN addgroup -S blackfire && adduser -S -H -G blackfire -u 999 blackfire
USER blackfire

CMD ["blackfire", "agent:start"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
