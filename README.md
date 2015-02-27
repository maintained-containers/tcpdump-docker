# tcpdump docker container

This simple image runs a tcpdump and writes dumps to the volume /data.
It will keep at max 10x 1GB files and overwrite the oldest one.

To capture on the hosts network interfaces, you need to run the
container by using the host networking mode:

    $ docker run --net=host corfr/tcpdump

To specify filters or interface, you can use this image as you would
use tcpdump, but this will override default parameters:

    $ docker run --net=host corfr/tcpdump -i eth2 port 80

If you want storage to happen on your host:

    $ docker run --net=host -v $PWD:/data corfr/tcpdump -i any -w /data/dump.pcap "icmp"

