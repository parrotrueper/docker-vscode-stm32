# Ubuntu image now has a default user
ARG BASE_IMAGE=ubuntu:24.04
FROM ${BASE_IMAGE}

ARG ARM_NONE_EABI_PATH=/opt/gcc-arm-none-eabi
ARG ARM_NONE_EABI_TARBALL=arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi.tar.xz

# set the toolchain path
ARG USER_PATH="${PATH}:${ARM_NONE_EABI_PATH}/bin"

WORKDIR /
COPY ${ARM_NONE_EABI_TARBALL} ./

RUN DEBIAN_FRONTEND=noninteractive \
    apt -y update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
    gdb \
    git \
    gnupg2 \
    gpg-agent \
    libusb-1.0 \
    libusb-1.0-0 \
    libusb-dev \
    ninja-build \
    openocd \
    stlink-tools \
    udev \
    usbutils \
    xz-utils \
    && echo "export PATH=${USER_PATH}" >> /etc/bash.bashrc \
    && chmod a+rx /etc/bash.bashrc \
    # install the arm toolchain
    && mkdir -p ${ARM_NONE_EABI_PATH} \
    && tar -xf ${ARM_NONE_EABI_TARBALL} --strip-components=1 -C ${ARM_NONE_EABI_PATH} \
    && rm -rf ${ARM_NONE_EABI_TARBALL}

USER ubuntu
WORKDIR /workspace
SHELL ["/usr/bin/bash", "-c"]
ENV PATH="${USER_PATH}"

