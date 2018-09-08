FROM gcc:8.2.0
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        autopoint \
        bash \
        bison \
        bzip2 \
        flex \
        g++ \
        g++-multilib \
        gettext \
        git \
        gperf \
        intltool \
        libc6-dev-i386 \
        libgdk-pixbuf2.0-dev \
        libltdl-dev \
        libssl-dev \
        libtool-bin \
        libxml-parser-perl \
        make \
        openssl \
        p7zip-full \
        patch \
        perl \
        pkg-config \
        python \
        ruby \
        sed \
        unzip \
        wget \
        xz-utils

RUN git clone https://github.com/mxe/mxe && \
    cd mxe && \
    git checkout 8891134d8ec6ce51786d55f1c1a41e902b73eef7 && \
    make \
        MXE_PLUGIN_DIRS=plugins/gcc8 \
        gcc

