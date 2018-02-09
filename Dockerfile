
FROM ubuntu:latest

LABEL maintainer="github.com/djesionek"

RUN apt-get update && apt-get install -y \
	vim \
	git \
	pandoc \
	texlive-full \
	build-essential \
	locales \
	ttf-ubuntu-font-family \
	lmodern \
	texlive-xetex \
	fontconfig

RUN locale-gen de_DE.UTF-8
ENV LANG='de_DE.UTF-8' LANGUAGE='de_DE' LC_ALL='de_DE.UTF-8'
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /build
WORKDIR /build
ENTRYPOINT bash build.sh
