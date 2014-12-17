FROM progrium/busybox
MAINTAINER Fabien Potencier <fabien.potencier@gmail.com>
ENV PORT 8307
EXPOSE 8307
ADD ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
RUN opkg-install curl
ADD blackfire-agent /usr/bin/blackfire-agent
ADD blackfire /usr/bin/blackfire
CMD ["blackfire-agent", "--socket", "tcp://0.0.0.0:8307", "--config", "/dev/null"]
