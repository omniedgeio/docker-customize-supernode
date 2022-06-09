FROM alpine:3.13

ENV LISTENING_PORT=443

EXPOSE ${LISTENING_PORT}

RUN BUILD_DEPENDENCIES=" \
        build-base \
        git \
        linux-headers \
        openssl-dev \
        bash \
        autoconf \
        automake \
    "; set -x \
    && apk add ${BUILD_DEPENDENCIES} \
    && cd /tmp \
    && git clone https://github.com/omniedgeio/n2n.git n2n \
    && cd n2n \
    && git checkout 2.6-fix \
    && ./autogen.sh \
    && ./configure \
    && make \
    && cp supernode /usr/bin/supernode \
    && apk del ${BUILD_DEPENDENCIES} \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

CMD /usr/bin/supernode -l ${LISTENING_PORT}