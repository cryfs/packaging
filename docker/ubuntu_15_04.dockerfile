FROM ubuntu:15.04
MAINTAINER Sebastian Messmer <messmer@cryfs.org>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget git python sudo cmake rpm g++ libfuse-dev

# Install biicode
COPY install_biicode.sh /install_biicode.sh
RUN /install_biicode.sh
RUN rm /install_biicode.sh

# Run one time, so the boost libraries are downloaded and compiled (we don't want that to happen on each call)
COPY init_package.sh /init_package.sh
RUN /init_package.sh https://github.com/cryfs/cryfs 0.8.1 /tmp/sourcedir
RUN rm -rf /tmp/sourcedir

# Add build script
COPY build_package.sh /build_package.sh
COPY generate_package.sh /generate_package.sh
ENTRYPOINT ["/generate_package.sh"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
