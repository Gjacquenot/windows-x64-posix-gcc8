FROM dockcross/windows-x64-posix

ENV DEFAULT_DOCKCROSS_IMAGE dockcross/windows-x64-posix-gcc8

RUN wget https://ftp.gnu.org/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.gz -O gcc.tar.gz && \
    mkdir -p gcc_src && \
    tar -xzf gcc.tar.gz --strip 1 -C gcc_src && \
    rm -rf gcc.tar.gz && \
    cd gcc_src && \
    ./contrib/download_prerequisites && \
    cd ..
RUN mkdir -p gcc_build && \
    cd gcc_build && \
    ../gcc_src/configure --prefix=/usr/src/mxe_gcc8 --host=x86_64-w64-mingw32 --enable-languages=c,c++,fortran --disable-multilib && \
    make && \
    make install && \
    cd .. && \
    rm -rf gcc_build
