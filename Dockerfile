FROM tbrock/saw:v0.2.2 as saw


FROM alpine:3.11

ENV BOTO3_VERSION=1.14.2
ENV BOTOCORE_VERSION=v2.tar.gz
ENV AWSCLI_VERSION=2.0.37.tar.gz

RUN apk --no-cache update && \
    apk --no-cache add \
        python3-dev=3.8.2-r0 \
        libffi-dev=3.2.1-r6 \
        openssl-dev=1.1.1g-r0 \
        ca-certificates=20191127-r2 \
        groff=1.22.4-r0 \
        less=551-r0 \
        bash=5.0.11-r1 \
        make=4.2.1-r2 \
        jq=1.6-r0 \
        gettext-dev=0.20.1-r2 \
        wget=1.20.3-r0 \
        curl=7.67.0-r0 \
        g++=9.2.0-r4 \
        zip=3.0-r7 \
        git=2.24.3-r0  && \
    pip3 --no-cache-dir install --upgrade pip==20.1.1 setuptools==46.1.3 && \
    pip3 --no-cache-dir install boto3==$BOTO3_VERSION \
                                https://github.com/boto/botocore/archive/$BOTOCORE_VERSION \
                                https://github.com/aws/aws-cli/archive/$AWSCLI_VERSION && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

COPY --from=saw /bin/saw /bin/saw

COPY scripts /opt/scripts

ENV PATH "$PATH:/opt/scripts"

WORKDIR /work

ENTRYPOINT [ "aws" ]

CMD [ "--version" ]
