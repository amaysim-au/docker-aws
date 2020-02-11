FROM alpine:3.6

ENV AWSCLI_VERSION=1.17.14

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less bash make jq gettext-dev curl wget g++ zip git && \
    pip --no-cache-dir install awscli==$AWSCLI_VERSION && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

COPY --from=tbrock/saw:v0.2.2 /bin/saw /bin/saw

COPY scripts /opt/scripts

ENV PATH "$PATH:/opt/scripts"

WORKDIR /work

ENTRYPOINT [ "aws" ]

CMD [ "--version" ]
