FROM ubuntu
# Original maintainer: Johannes 'fish' Ziemke <docker@freigeist.org>
MAINTAINER Bertrand Roussel <bertrand.roussel@cor-net.org>

VOLUME  [ "/data" ]
RUN apt-get update &&  apt-get -y -q install tcpdump

CMD [ "-C", "1000", "-W", "100", "-v", "-w", "/data/dump" ]
ENTRYPOINT [ "/usr/sbin/tcpdump" ]
