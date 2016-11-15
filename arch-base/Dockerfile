
# download to this directory: http://ftp.halifax.rwth-aachen.de/archlinux/iso/2015.07.01/archlinux-bootstrap-2015.07.01-x86_64.tar.gz and rename to archlinux-bootstrap.tar.gz

FROM busybox:latest

MAINTAINER bitpick <bitpick@das-labor.org>

ENV mirror http://mirrorservice.org/sites/ftp.archlinux.org/iso
ENV version 2016.11.01
ENV arch x86_64

RUN cd / \
    && wget ${mirror}/${version}/archlinux-bootstrap-${version}-${arch}.tar.gz \
    && tar --overwrite --strip-components=1 -xf /archlinux-bootstrap-${version}-${arch}.tar.gz \
    && rm -f /archlinux-bootstrap-${version}-${arch}.tar.gz

ADD mirrorselect.pl /mirrorselect.pl

RUN /mirrorselect.pl /etc/pacman.d/mirrorlist \
    && /usr/bin/pacman-key --init \
    && /usr/bin/pacman-key --populate archlinux \
    && /usr/bin/pacman -Syu --noconfirm --needed

