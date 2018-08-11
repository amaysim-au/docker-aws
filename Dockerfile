FROM alpine:3.8
RUN apk --no-cache update && \
    apk --no-cache add python py-pip bash coreutils jq ca-certificates gettext && \
    pip --no-cache-dir install aws-shell && \
    update-ca-certificates && \
    apk del py-pip && \
    rm -rf /var/cache/apk/*
COPY scripts /opt/scripts
ENV PATH "$PATH:/opt/scripts"
WORKDIR /opt/app
