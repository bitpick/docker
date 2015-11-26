
# download to this directory: http://ftp.halifax.rwth-aachen.de/archlinux/iso/2015.07.01/archlinux-bootstrap-2015.07.01-x86_64.tar.gz and rename to archlinux-bootstrap.tar.gz

FROM bitpick/scratch-tools:latest

MAINTAINER bitpick <bitpick@das-labor.org>

ENV mirror http://mirrorservice.org/sites/distfiles.gentoo.org
ENV version 20151119
ENV arch amd64

ADD ${mirror}/releases/${arch}/autobuilds/current-stage3-${arch}/stage3-${arch}-${version}.tar.bz2 /stage3-latest.tar.bz2
ADD ${mirror}/snapshots/portage-latest.tar.bz2 /portage-latest.tar.bz2

RUN ["/tools/tar", "-I", "/tools/bzip2", "-xf", "stage3-latest.tar.bz2", "-X", "/tools/exclude"]
RUN ["/tools/tar", "-I", "/tools/bzip2", "-xf", "portage-latest.tar.bz2", "-C", "/usr"]

RUN ["/bin/rm", "-rf", "/*.tar.bz2"]
RUN ["/bin/rm", "-rf", "/tools"]

RUN ["emerge", "--sync"]
RUN ["emerge", "-vuDNq", "--with-bdeps=y", "--backtrack=30", "@world"]

