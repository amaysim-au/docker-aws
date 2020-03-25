FROM tbrock/saw:v0.2.2 as saw


FROM alpine:3.7

ENV AWSCLI_VERSION=1.17.14

RUN apk --no-cache update && \
    apk --no-cache add \
        python=2.7.15-r3 \
        py-pip=9.0.1-r1 \
        py-setuptools=33.1.1-r1 \
        ca-certificates=20190108-r0 \
        groff=1.22.3-r2 \
        less=520-r0 \
        bash=4.4.19-r1 \
        make=4.2.1-r0 \
        jq=1.5-r5 \
        gettext-dev=0.19.8.1-r1 \
        wget=1.20.3-r0 \
        curl=7.61.1-r3 \
        g++=6.4.0-r5 \
        zip=3.0-r4 \
        git=2.15.4-r0  && \
    pip --no-cache-dir install awscli==$AWSCLI_VERSION && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

RUN pip install boto3==1.12.28

COPY --from=saw /bin/saw /bin/saw

COPY scripts /opt/scripts

ENV PATH "$PATH:/opt/scripts"

WORKDIR /work

ENTRYPOINT [ "aws" ]

CMD [ "--version" ]
