FROM alpine
# Original maintainer: Johannes 'fish' Ziemke <docker@freigeist.org>
# Original maintainer #2: Bertrand Roussel <bertrand.roussel@cor-net.org>

MAINTAINER Robert Bost <bostrt@gmail.com>

VOLUME  [ "/data" ]
RUN apk add --no-cache tcpdump coreutils

CMD [ "-C", "1000", "-W", "100", "-v", "-w", "/data/dump" ]
ENTRYPOINT [ "/usr/bin/tcpdump" ]
