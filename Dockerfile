FROM debian:latest

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV WORKDIR="/build_img"

RUN apt-get update && \
    apt-get install -y install make vmdb2 dosfstools qemu-utils qemu-user-static debootstrap binfmt-support time kpartx bmap-tools python3 ansible-core && \
    ansible-galaxy collection install community.general

WORKDIR WORKDIR
COPY . WORKDIR
ENTRYPOINT ["make"]
