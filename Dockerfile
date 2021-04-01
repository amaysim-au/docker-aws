FROM tbrock/saw:v0.2.2 as saw

FROM alpine:3.11

ENV BOTO3_VERSION=1.17.42
ENV AWSCLI_VERSION=1.19.42

RUN apk --no-cache update && \
    apk --no-cache add \
    python3-dev=3.8.2-r2 \
    libffi-dev=3.2.1-r6 \
    openssl-dev=1.1.1k-r0 \
    ca-certificates=20191127-r2 \
    groff=1.22.4-r0 \
    less=551-r0 \
    bash=5.0.11-r1 \
    make=4.2.1-r2 \
    jq=1.6-r0 \
    gettext-dev=0.20.1-r2 \
    wget=1.20.3-r0 \
    curl=7.67.0-r3 \
    g++=9.3.0-r0 \
    zip=3.0-r7 \
    git=2.24.4-r0 && \
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