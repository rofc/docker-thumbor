FROM ubuntu:14.04

MAINTAINER Roberto O. Fernández Crisial <roberto@fernandezcrisial.com>

RUN apt-get update
RUN apt-get install -y build-essential python-dev curl python-pycurl python-pip python-numpy python-opencv webp libpng-dev libtiff-dev libjasper-dev libjpeg-dev libdc1394-22-dev libdc1394-22 libdc1394-utils rpl

RUN pip install thumbor

#RUN thumbor-config > /etc/thumbor.conf
ADD https://github.com/rofc/thumbor5/blob/master/thumbor.conf /etc/

RUN rpl '$$$MY_SECRET_KEY$$$' '0123456789012345678901234567' /etc/thumbor.conf

#EXPOSE 8888

#ENTRYPOINT ["/usr/local/bin/thumbor"]
