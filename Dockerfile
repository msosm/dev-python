FROM alpine:3.10

ENV PATH /usr/local/bin:$PATH
ENV PYTHONPATH /usr/local/src
ENV TZ: Asia/Tokyo

ARG PYTHON_VERSION=3.7.5

RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src

RUN apk update upgarade && \
    apk --no-chache add --update alpine-sdk \
                                    zlib-dev \
                                    build-base \
                                    libffi-dev \
                                    openssl-dev \
                                    openssh \
                                    tree && \
    wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-${PYTHON_VERSION}.tgz && \
    tar xzf Python-${PYTHON_VERSION}.tgz && \
    rm -rf ./Python-${PYTHON_VERSION}.tgz && \
    cd ./Python-${PYTHON_VERSION} && \
    ./configure --with-ensurepip --enable-optimizations && \
    make altinstall && \
    pip3.7 install --upgrade pip && \
    apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    rm -rf /var/cache/apk/* && \
    rm -rf  /usr/local/src/Python-${PYTHON_VERSION}

COPY python /usr/local/bin/
RUN chmod 755 /usr/local/bin/python

