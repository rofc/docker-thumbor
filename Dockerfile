FROM ubuntu:14.04

MAINTAINER Roberto O. Fernández Crisial <roberto@fernandezcrisial.com>

RUN apt-get update --fix-missing
RUN apt-get install -y build-essential python-dev curl python-pycurl python-pip python-numpy python-opencv webp libpng-dev libtiff-dev libjasper-dev libjpeg-dev libdc1394-22-dev libdc1394-22 libdc1394-utils
RUN pip install thumbor

RUN thumbor-config > /etc/thumbor.conf

ADD thumbor.sh /
RUN chmod +x /thumbor.sh

EXPOSE 8888

CMD ["/thumbor.sh"]
