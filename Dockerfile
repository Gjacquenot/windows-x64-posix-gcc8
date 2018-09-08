FROM gcc:8.2.0
RUN git clone https://github.com/mxe/mxe && \
    cd mxe && \
    git checkout 8891134d8ec6ce51786d55f1c1a41e902b73eef7 && \
    make \
        MXE_PLUGIN_DIRS=plugins/gcc8 \
        gcc

