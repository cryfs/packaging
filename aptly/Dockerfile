FROM ubuntu:18.10
MAINTAINER Sebastian Messmer <messmer@cryfs.org>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade

RUN DEBIAN_FRONTENT=noninteractive apt-get install -y gnupg ca-certificates bzip2

RUN echo deb http://repo.aptly.info/ squeeze main >> /etc/apt/sources.list
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys ED75B5A4483DA07C
RUN DEBIAN_FRONTEND=noninteractive apt-get update

RUN DEBIAN_FRONTENT=noninteractive apt-get install -y aptly

COPY aptly.conf /root/.aptly.conf

COPY incontainer_bin /usr/local/bin

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
