FROM alpine

RUN apk add --update curl-dev gcc gettext jasper-dev jpeg-dev libwebp libpng musl-dev python-dev py-pip tiff-dev

RUN pip install --upgrade pip

RUN pip install thumbor

RUN mkdir /docker-thumbor
COPY scripts /docker-thumbor

ENTRYPOINT ["./docker-thumbor/entrypoint.sh"]
