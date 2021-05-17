FROM tbrock/saw:v0.2.2 as saw

FROM alpine:3.13

ENV BOTO3_VERSION=1.17.73
ENV AWSCLI_VERSION=1.19.73

RUN apk --no-cache update && \
    apk --no-cache add \
        python3-dev \
        py3-pip \
        libffi-dev \
        openssl-dev \
        ca-certificates \
        groff \
        less \
        bash \
        make \
        jq \
        gettext-dev \
        wget \
        curl \
        g++ \
        zip \
        git && \
    pip3 --no-cache-dir install --upgrade \
    pip==21.0.1 \
    setuptools==46.1.3 \
    dnxsso==0.5.0 \
    awscli==$AWSCLI_VERSION \
    boto3==$BOTO3_VERSION && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

COPY --from=saw /bin/saw /bin/saw

COPY scripts /opt/scripts

ENV PATH "$PATH:/opt/scripts"

WORKDIR /work

ENTRYPOINT [ "aws" ]

CMD [ "--version" ]