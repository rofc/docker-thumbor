FROM ubuntu:14.04

MAINTAINER Roberto O. Fernández Crisial <roberto@fernandezcrisial.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y build-essential python-dev curl python-pycurl python-pip
RUN apt-get install -y python-numpy python-opencv webp libpng-dev libtiff-dev libjasper-dev libjpeg-dev
RUN apt-get install -y libdc1394-22-dev libdc1394-22 libdc1394-utils
RUN apt-get install -y initscripts upstart

RUN pip install thumbor

RUN thumbor-config > /etc/thumbor.conf
RUN echo "description \"Thumbor5\"" > /etc/init/thumbor.conf
RUN echo "author \"Roberto O. Fernández Crisial <roberto@fernandezcrisial.com.ar>\"" >> /etc/init/thumbor.conf
RUN echo "" > /etc/init/thumbor.conf
RUN echo "start on startup" >> /etc/init/thumbor.conf
RUN echo "stop on shutdown" >> /etc/init/thumbor.conf
RUN echo "" > /etc/init/thumbor.conf
RUN echo "exec thumbor -c /etc/thumbor.conf" >> /etc/init/thumbor.conf
RUN echo "" > /etc/init/thumbor.conf
RUN echo "post-start script" >> /etc/init/thumbor.conf
RUN echo "" > /etc/init/thumbor.conf
RUN echo "	PID=\`status thumbor | egrep -oi '([0-9]+)$' | head -n1\`" >> /etc/init/thumbor.conf
RUN echo "	echo $PID > /var/run/thumbor.pid" >> /etc/init/thumbor.conf
RUN echo "end script" >> /etc/init/thumbor.conf
RUN echo "" > /etc/init/thumbor.conf
RUN echo "post-stop script" >> /etc/init/thumbor.conf
RUN echo "rm -f /var/run/thumbor.pid" >> /etc/init/thumbor.conf
RUN echo "end script" >> /etc/init/thumbor.conf
RUN chmod 755 /etc/init/thumbor.conf

EXPOSE 8888

ENTRYPOINT exec /usr/local/bin/thumbor
