FROM aarch64/ubuntu:xenial
COPY basic_pkg.sh /build/
RUN  bash /build/basic_pkg.sh

COPY atlas_pkg.sh /build/
RUN  bash /build/atlas_pkg.sh

WORKDIR /opt
RUN wget --no-check-certificate https://raw.githubusercontent.com/Ascend/tools/master/make_ubuntu_sd.sh > /dev/null 2>&1;\
    wget --no-check-certificate https://raw.githubusercontent.com/Ascend/tools/master/make_sd_card.py > /dev/null 2>&1

RUN apt-get update;\
    apt-get install -y --no-install-recommends python python-pip python ipython;\
    rm -rf /var/lib/apt/lists/*

RUN wget http://old-releases.ubuntu.com/releases/16.04.3/ubuntu-16.04.3-server-arm64.iso > /dev/null 2>&1
