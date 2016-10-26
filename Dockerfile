FROM ubuntu:14.04

#
# Base image for QEMU development.
#
# Includes QEMU dependencies and some additional tools.
#
# Ref to README.md file
#

MAINTAINER Christophe Guillon <christophe.guillon@st.com>

# Basic net and development tools
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y ssl-cert wget curl \
    telnet openssh-client net-tools iputils-ping sudo && \
    apt-get install -y build-essential gcc clang python perl zip git-core && \
    apt-get install -y emacs24-nox vim-nox

# QEMU base dependencies
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y pkg-config \
    zlib1g-dev libglib2.0-dev libpixman-1-dev libfdt-dev

# QEMU additional optional dependencies
RUN cd /tmp && rm -f *.deb && \
    wget http://www.capstone-engine.org/download/3.0.4/ubuntu-14.04/libcapstone-dev_3.0.4-0.1ubuntu1_amd64.deb && \
    wget http://www.capstone-engine.org/download/3.0.4/ubuntu-14.04/libcapstone3_3.0.4-0.1ubuntu1_amd64.deb && \
    wget http://www.capstone-engine.org/download/3.0.4/ubuntu-14.04/python-capstone_3.0.4-0.1ubuntu1_amd64.deb && \
    dpkg -i *.deb && rm -f *.deb

# Install local files for reference
COPY README.md Dockerfile /dockerfiles/guillon/qemu-dev/
