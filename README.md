QEMU dev
========

This is a base image for building QEMU and qemu-plugins.

It is base on the ubuntu:14.04 image and adds QEMU dependencies, gcc/clang
compilers, libcapstone3 disassembler library.

This image is used in particular as a base build for Docker images
qemu-plugins and qemu-tutorial.

Run
---

Run the image with:

    $ docker pull guillon/qemu-dev
    $ docker run -it guillon/qemu-dev
    root@container:~$

Use Image
---------

From this image, one may clone QEMU and build it directly as it contains the
necessary build dependency (including dependencies for the qemu-plugins repo).

For instance, build a linux-user qemu-plugins for aarch64 and x86_64 with:

    $ git clone https://github.com/guillon/qemu-plugins
    $ cd qemu-plugins
    $ git checkout next/master
    $ ./configure --disable-werror --enable-capstone --enable-tcg-plugin \
    --disable-system --target-list=x86_64-linux-user,aarch64-linux-user --prefix=$PWD/devimage
    $ make -j4 && make install

Modify Image
------------

The image sources are located at https://github.com/guillon/docker-qemu-dev, actually an automated Docker hub build is setup and the images are available at https://hub.docker.com/r/guillon/qemu-dev/ when this repo is modified.

In order to rebuild the image locally, extract sources and execute the `./build.sh` script which build the Docker image locally under the name `guillon/dev-qemu-dev`:

    $ git clone https://github.com/guillon/docker-qemu-dev
    $ cd docker-qemu-dev
    $ ./build.sh
    $ docker run -it guillon/dev-qemu-dev
    ...
    
References
----------

Ref QEMU repository: https://github.com/qemu/qemu

Ref qemu-plugins repository: https://github.com/guillon/qemu-plugins

Ref docker-qemu-dev repository: https://github.com/guillon/docker-qemu-dev

Ref docker hub prebuilt images: https://hub.docker.com/r/guillon/qemu-dev/
