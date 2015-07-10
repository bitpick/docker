
FROM bitpick/gentoo-base:latest

MAINTAINER bitpick <bitpick@das-labor.org>

RUN ["emerge", "--sync"]
RUN ["emerge", "-vuDNq", "--with-bdeps=y", "--backtrack=30", "@world"]
RUN ["emerge", "-vq", "crossdev", "gentoolkit", "binutils"]
RUN ["mkdir", "-p", "/usr/local/portage"]
RUN ["crossdev", "-S", "-P", "-vq", "-t", "mingw32", "--ov-output", "/usr/local/portage"]
RUN ["eclean", "packages", "&&", "eclean", "distfiles"]

