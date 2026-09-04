FROM alpine:3.24 AS bin

ARG TARGETARCH

ADD https://s3-eu-west-1.amazonaws.com/testing.packages.blackfire.io/blackfire/2026.9.0%2Bp6-internal/blackfire-linux_${TARGETARCH:-amd64} /usr/local/bin/blackfire
RUN chmod 0555 /usr/local/bin/blackfire

FROM alpine:3.24

ENV BLACKFIRE_CONFIG /dev/null
ENV BLACKFIRE_LOG_LEVEL 1
ENV BLACKFIRE_SOCKET tcp://0.0.0.0:8307
EXPOSE 8307

# `apk add` never touches the packages already shipped by the base image, so
# openssl & friends stay on whatever version alpine:3.24 was built with. Upgrade
# them explicitly, otherwise a rebuild keeps publishing known CVEs.
RUN apk upgrade --no-cache \
 && apk add --no-cache curl ca-certificates \
 && addgroup -S blackfire \
 && adduser -S -H -G blackfire -u 999 blackfire

COPY --from=bin /usr/local/bin/blackfire /usr/local/bin/blackfire

# Don't run as root
USER blackfire

HEALTHCHECK CMD blackfire agent:healthcheck

CMD ["blackfire", "agent:start"]
