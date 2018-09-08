FROM dockcross/windows-x64-posix
RUN mkdir -p /usr/src/mxe/plugins/gcc8
ADD gcc8-overlay.mk /usr/src/mxe/plugins/gcc8
ADD gcc8.patch /usr/src/mxe/plugins/gcc8
RUN cd /usr/src/mxe && \
    make \
        MXE_PLUGIN_DIRS=plugins/gcc8 \
        gcc
