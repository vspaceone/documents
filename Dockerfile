
FROM ubuntu:latest

MAINTAINER Maximilian Noppel

RUN apt-get update && apt-get install -y \
  vim \
	git \
	pandoc \
	texlive-full \
	build-essential \
  apt-utils

RUN apt-get update && apt-get install -y \
	ttf-ubuntu-font-family \
	lmodern \
	texlive-xetex \
	fontconfig

RUN locale-gen de_DE.UTF-8
ENV LANG='de_DE.UTF-8' LANGUAGE='de_DE' LC_ALL='de_DE.UTF-8'
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /builddir
#ENTRYPOINT file paper_template.tex
ENTRYPOINT bash build.sh && cat vc.txt
