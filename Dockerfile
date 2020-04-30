FROM ubuntu:bionic

ARG OVFTOOL_BUNDLE=
ARG BUILD_DATE

LABEL maintainer="Shawn Black <shawn@castleblack.us>" \
      vendor="Castle Black" \
      build_date="${BUILD_DATE}" \
      ovf_bundle="${OVFTOOL_BUNDLE}"

COPY $OVFTOOL_BUNDLE /src/$OVFTOOL_BUNDLE

RUN apt-get update && \
    apt-get install -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    export LC_ALL=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    locale-gen en_US.UTF-8 && \
    /bin/sh /src/$OVFTOOL_BUNDLE --console --required --eulas-agreed && \
    rm -fr /src

WORKDIR /ovftool

ENTRYPOINT ["/usr/bin/ovftool"]
