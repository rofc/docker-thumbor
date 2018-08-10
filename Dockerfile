FROM alpine

RUN apk add --update curl-dev gcc gettext jasper-dev jpeg-dev libwebp libpng musl-dev python-dev py-pip tiff-dev

RUN pip install --upgrade pip

RUN pip install thumbor

COPY thumbor.sh /

#ENTRYPOINT ["/bin/sh", "-c", "./thumbor.sh"]
ENTRYPOINT ["./thumbor.sh"]
