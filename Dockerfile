#
# Copyright 2020 Shawn Black, Castle Black
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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
