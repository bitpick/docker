
# download to this directory: http://ftp.halifax.rwth-aachen.de/archlinux/iso/2015.07.01/archlinux-bootstrap-2015.07.01-x86_64.tar.gz and rename to archlinux-bootstrap.tar.gz

FROM bitpick/scratch-tools:latest

MAINTAINER bitpick <bitpick@das-labor.org>

ENV mirror http://mirrorservice.org/sites/ftp.archlinux.org/iso
ENV version 2015.11.01
ENV arch x86_64

ADD ${mirror}/${version}/archlinux-bootstrap-${version}-${arch}.tar.gz /archlinux-bootstrap.tar.gz

RUN ["/tools/tar", "-I", "/tools/gzip", "-xf", "archlinux-bootstrap.tar.gz", "-X", "/tools/exclude", "--strip-components=1"]
RUN ["/usr/bin/rm", "archlinux-bootstrap.tar.gz"]

RUN ["pacman-key", "--init"]
RUN ["pacman-key", "--populate", "archlinux"]
RUN ["/tools/mirrors.pl", "/etc/pacman.d/mirrorlist"]
RUN ["pacman", "-Syu", "--noconfirm", "--needed"]

RUN ["/usr/bin/rm", "-rf", "/tools"]
