FROM ubuntu:15.10
MAINTAINER Sebastian Messmer <messmer@cryfs.org>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade

# TODO Don't need nano once Dockerfile is final
RUN DEBIAN_FRONTENT=noninteractive apt-get install -y aptly nano

# TODO: Set to correct bucket/region
COPY aptly.conf /root/.aptly.conf

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
