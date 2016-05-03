FROM ubuntu:15.10
MAINTAINER Sebastian Messmer <messmer@cryfs.org>

RUN echo deb http://repo.aptly.info/ squeeze main >> /etc/apt/sources.list
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 9E3E53F19C7DE460

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade

RUN DEBIAN_FRONTENT=noninteractive apt-get install -y aptly ca-certificates bzip2

COPY aptly.conf /root/.aptly.conf

COPY incontainer_bin /usr/local/bin

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
