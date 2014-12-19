FROM progrium/busybox
MAINTAINER Fabien Potencier <fabien.potencier@gmail.com>
ENV PORT 8707
EXPOSE 8707
ADD ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
RUN opkg-install curl
ADD blackfire-agent /usr/bin/blackfire-agent
ADD blackfire /usr/bin/blackfire
CMD ["blackfire-agent", "--socket", "tcp://0.0.0.0:8707", "--config", "/dev/null"]
