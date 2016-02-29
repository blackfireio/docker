FROM progrium/busybox
MAINTAINER Fabien Potencier <fabien.potencier@gmail.com>
ENV PORT 8707
EXPOSE 8707
ADD ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
ADD opkg.conf /etc/opkg.conf
RUN opkg-cl remove --force-removal-of-essential-packages libc && \
    opkg-cl install http://downloads.openwrt.org/chaos_calmer/15.05/x86/64/packages/base/libc_0.9.33.2-1_x86_64.ipk && \
    ln -nsf libc.so.0 /lib/libc.so && \
    opkg-install curl && \
    rm -Rf /var/opkg-lists/packages
ADD blackfire-agent /usr/bin/blackfire-agent
ADD blackfire /usr/bin/blackfire
CMD ["blackfire-agent", "--socket", "tcp://0.0.0.0:8707", "--config", "/dev/null"]
