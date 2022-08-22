FROM alpine:3.13

ENV LISTENING_PORT=7787
ARG TARGETARCH
ARG VERSION=2.6-stable-omni

# 2.6-stable-omni
# 3.0-stable

EXPOSE ${LISTENING_PORT}

RUN echo "super node version is: ${VERSION}"
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
    && git checkout ${VERSION} \
    && ./autogen.sh \
    && ./configure \
    && make \
    && cp supernode /usr/bin/supernode \
    && apk del ${BUILD_DEPENDENCIES} \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

CMD /usr/bin/supernode -l ${LISTENING_PORT}

