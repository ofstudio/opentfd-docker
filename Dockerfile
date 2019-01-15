FROM python:3-alpine
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
VOLUME /var/lib/opentfd
WORKDIR /usr/src/opentfd
RUN git clone --depth 1 https://github.com/SlavikMIPT/opentfd.git .
RUN pip3 install -r requirements.txt
COPY entrypoint /
ENTRYPOINT [ "/entrypoint" ]
