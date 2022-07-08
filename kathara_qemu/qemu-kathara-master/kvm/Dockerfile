FROM debian:latest

COPY deb.qcow2 /usr/local/image.qcow2

ARG DEBIAN_FRONTEND="noninteractive"
RUN apt update && \
    apt upgrade -y && \
    apt install -y bridge-utils iproute2 iptables qemu-kvm libguestfs-tools socat tcpdump && \
    apt clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN update-alternatives --set iptables /usr/sbin/iptables-legacy

COPY start.sh /start.sh
COPY setup.sh /tmp/setup.sh
COPY interfaces /tmp/interfaces
COPY startup.sh /tmp/startup.sh
COPY startUp.service /tmp/startUp.service
COPY changeInterface.sh /tmp/changeInterface.sh
RUN chmod u+x /start.sh
RUN chmod u+x /tmp/interfaces
RUN chmod u+x /tmp/startup.sh
RUN chmod u+x /tmp/setup.sh
RUN chmod u+x /tmp/changeInterface.sh
COPY startvm /usr/local/bin/startvm
RUN chmod u+x /usr/local/bin/startvm
#ENTRYPOINT ["/usr/local/bin/startvm"]

