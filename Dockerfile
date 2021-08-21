FROM --platform=amd64 ubuntu:20.04
ENV TZ="Asia/Tokyo"
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8


# install development tools
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    # この辺のバージョンいじった
    llvm-dev \
    lld \
    clang \
    nasm \
    acpica-tools \
    uuid-dev \
    qemu-system-x86 \
    qemu-utils \
    xauth \
    unzip \
    # added
    qemu-system-gui \
    dosfstools \
    git \
    python3-distutils \
    # for arm64 cross-compile
    libc6-dev-amd64-cross \
    binutils-x86-64-linux-gnu \
    x11-apps \
 && apt-get clean -y \
 && rm -rf /var/lib/apt/lists



# set X11 server address
ENV DISPLAY=host.docker.internal:0

WORKDIR /root/c