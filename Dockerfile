
FROM ubuntu:14.04

MAINTAINER Maximilian Noppel



RUN apt-get update && apt-get install -y \
  vim \
	git \
	pandoc \
	texlive-full
