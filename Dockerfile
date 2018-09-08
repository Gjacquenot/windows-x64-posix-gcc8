# https://github.com/mxe/mxe/issues/2204

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
        wine \
        xz-utils

# Get the gcc8 cross compiler for windows
# make MXE_TARGETS=x86_64-w64-mingw32.static.gcc8 gcc
RUN git clone https://github.com/mxe/mxe && \
    cd mxe && \
    git checkout 8891134d8ec6ce51786d55f1c1a41e902b73eef7 && \
    make \
        MXE_TARGETS=x86_64-w64-mingw32.static \
        MXE_PLUGIN_DIRS=plugins/gcc8 \
        gcc

RUN /mxe/usr/bin/x86_64-w64-mingw32.static-gcc --version && \
    /mxe/usr/bin/x86_64-w64-mingw32.static-g++ --version && \
    /mxe/usr/bin/x86_64-w64-mingw32.static-gfortran --version

RUN echo "program test" > test.f90 && \
    echo "integer, parameter :: dp = kind(1.d0)" >> test.f90 && \
    echo "real(kind=dp) :: vec(2,3,3,6,2,3,12,8)" >> test.f90 && \
    echo "end program" >> test.f90 && \
    cat test.f90 && \
    /mxe/usr/bin/x86_64-w64-mingw32.static-gfortran -std=f2008 test.f90 -o test.exe && \
    wine ./test.exe

