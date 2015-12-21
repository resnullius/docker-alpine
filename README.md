# docker-alpine

`x86_64`:
[![Docker Stars](https://img.shields.io/docker/stars/resnullius/alpine.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/resnullius/alpine.svg)][hub]
[![Image Size](https://img.shields.io/imagelayers/image-size/resnullius/alpine/latest.svg)](https://imagelayers.io/?images=resnullius/alpine:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/resnullius/alpine/latest.svg)](https://imagelayers.io/?images=resnullius/alpine:latest)

`armv7l`:
[![Docker Stars](https://img.shields.io/docker/stars/resnullius/alpine-armv7l.svg)][hub-arm]
[![Docker Pulls](https://img.shields.io/docker/pulls/resnullius/alpine-armv7l.svg)][hub-arm]
[![Image Size](https://img.shields.io/imagelayers/image-size/resnullius/alpine-armv7l/latest.svg)](https://imagelayers.io/?images=resnullius/alpine-armv7l:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/resnullius/alpine-armv7l/latest.svg)](https://imagelayers.io/?images=resnullius/alpine-armv7l:latest)

    docker pull resnullius/alpine:latest
    docker pull resnullius/alpine-armv7l:latest

This is a fork from the [`gliderlabs/docker-alpine`](https://github.com/gliderlabs/docker-alpine) project that works on `armhf`/`armv7l` and `x86_64` (the original project works on `x86_64` by default) machines. It's based off from the `gliderlabs/alpine` and differs in the repository being used (`nl.alpinelinux.org` instead of `fastly`) and the versions supported (support starts from `v3.2`).

The resulting images are from [Alpine Linux][alpine], a minimalist Linux distribution that uses `musl` instead of `glibc`. The final size of the non-development images is between 4MB and 5MB.

## Building stuff

    orchestrator build

The build will take **all** the files inside the `versions/$ARCH/` directory and build them; if only one file from there should be built the command used should look like this:

    orchestrator build versions/armv7l/resnullius-3.2/options

That will build `v3.2`. Please, make sure to run options from the architecture you are running. If using the `orchestrator build` command, it will auto-detect what's your architecture.

## Code organization

Since it supports the build of two architectures (`armv7l` and `x86_64`), everything is built on two, you can see `builder/armv7l` and `builder/x86_64`. If anything on `builder/$ARCH/scripts` needs to be updated, that should be done on `builder/base` and run `./update-builder.bash run`.

## License

The code in this repository, unless otherwise noted, is BSD licensed. See the `LICENSE` file in this repository.

[alpine]: https://www.alpinelinux.org/
[hub]: https://hub.docker.com/r/resnullius/alpine/
[hub-arm]: https://hub.docker.com/r/resnullius/alpine-armv7l/
