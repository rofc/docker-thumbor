FROM ubuntu:14.04

MAINTAINER Roberto O. Fernández Crisial <roberto@fernandezcrisial.com>

RUN apt-get update --fix-missing
RUN apt-get install -y build-essential python-dev curl python-pycurl python-pip python-numpy python-opencv webp libpng-dev libtiff-dev libjasper-dev libjpeg-dev libdc1394-22-dev libdc1394-22 libdc1394-utils
RUN pip install thumbor

RUN thumbor-config > /etc/thumbor.conf
RUN sed -i "s/#SECURITY_KEY = 'MY_SECURE_KEY'/SECURITY_KEY = '$SECURITY_KEY'/g" /etc/thumbor.conf
RUN sed -i "s/#ALLOW_UNSAFE_URL = True/ALLOW_UNSAFE_URL = $ALLOW_UNSAFE_URL/g" /etc/thumbor.conf

EXPOSE 8888

#ENTRYPOINT ["/usr/local/bin/thumbor"]
