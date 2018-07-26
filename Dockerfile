
FROM ubuntu:latest

LABEL maintainer="github.com/djesionek"

RUN apt-get update && apt-get install -y \
	git \
	make \
	pandoc \
	biber \
	texlive-full \
	build-essential \
  apt-utils \
	locales

RUN apt-get update && apt-get install -y \
	ttf-ubuntu-font-family \
	lmodern

RUN locale-gen de_DE.UTF-8
ENV LANG='de_DE.UTF-8' LANGUAGE='de_DE' LC_ALL='de_DE.UTF-8'
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /build
WORKDIR /build
ENTRYPOINT bash build.sh
