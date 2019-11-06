FROM alpine:latest
RUN apk --no-cache add python3 bash gettext jq && \
    pip3 install --no-cache --upgrade pip && \
    pip3 install --no-cache aws-shell
COPY scripts /opt/scripts
ENV PATH "$PATH:/opt/scripts"
WORKDIR /opt/app
