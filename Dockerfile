FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt install -y  \
        python2.7 \
        python-pip \
        gcc-arm-none-eabi \
        git \
        mercurial && \
    apt autoremove && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install mbed-cli

RUN git clone https://github.com/ARMmbed/mbed-cli && \
    cd mbed-cli/tools/bash_completion && \
    cp mbed /etc/bash_completion.d/


RUN mbed config --global GCC_ARM_PATH /usr/bin


CMD ["/bin/bash"]
