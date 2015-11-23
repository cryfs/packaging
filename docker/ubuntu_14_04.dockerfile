FROM ubuntu:14.04
MAINTAINER Sebastian Messmer <messmer@cryfs.org>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget git python sudo software-properties-common rpm libfuse-dev

# Update gcc
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y g++-4.9 cmake && \
    DEBIAN_FRONTEND=noninteractive update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 90

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
