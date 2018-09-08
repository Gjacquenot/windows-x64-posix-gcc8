FROM dockcross/windows-x64-posix
ADD gcc8.mk /usr/src/mxe/src/.
RUN cd /usr/src/mxe && \
    make \
        MXE_TARGETS=x86_64-w64-mingw32.static \
        MXE_TARGET_ARCH=x86_64 \
        MXE_TARGET_THREAD=.posix \
        gcc8

