# tcpdump docker container

This simple image runs a tcpdump and writes dumps to the volume /data.
It will keep at max 10x 1GB files and overwrite the oldest one.

To capture on the hosts network interfaces, you need to run the
container by using the host networking mode:

    $ docker run --net=host maintained/tcpdump

To specify filters or interface, you can use this image as you would
use tcpdump, but this will override default parameters:

    $ docker run --net=host maintained/tcpdump -i eth2 port 80

If you want storage to happen on your host:
(the important part is to mount the volume using docker -v, and to write data in that volume using tcpdump -w)

    $ docker run --net=host -v $PWD:/data maintained/tcpdump -i any -w /data/dump.pcap "icmp"

To analyze the stream live remotely from wireshark:
(don't forget to filter out traffic on port 22)

    $ ssh root@remote-host "docker run --rm --net=host maintained/tcpdump -i any -w - not port 22 2>/dev/null" |wireshark -k -i -

