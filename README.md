<!--
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
-->

[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)

# Containerized Open Virtualization Format Tool

This is a [Open Container Initiative (OCI)](https://www.opencontainers.org/) container image for the [Open Virtualization Format Tool (ovftool)](https://code.vmware.com/tool/ovf).

VMware OVF Tool is a command-line utility that allows you to import and export OVF packages to and from many VMware products.

This project is not affiliated with [Open Container Initiative (OCI)](https://www.opencontainers.org/) nor [VMware](https://www.vmware.com/).

## Container Repositories

[Quay.io](https://quay.io/repository/0xcastleblack/ovftool)

[Docker Hub](https://hub.docker.com/r/0xcastleblack/ovftool)

## Assumptions

This container image assumes that you have read and agreed to any end-user license agreement, privacy policy, legalese, etc., provided when installing [Open Virtualization Format Tool (ovftool)](https://code.vmware.com/tool/ovf).

## Building

```bash
buildah bud --build-arg OVFTOOL_BUNDLE=VMware-ovftool-VERSION-BUILD-lin.x86_64.bundle --build-arg BUILD_DATE=`date --utc +%FT%TZ` --tag 0xcastleblack/ovftool
```

## Usage

[Podman](https://podman.io/) is used as the container engine in the following examples. `podman` and `docker` are interchangeable.

Obtaining the version of ovftool:

```bash
podman run --rm -it 0xcastleblack/ovftool --version
```

Obtaining the help for the ovftool:

```bash
podman run --rm -it 0xcastleblack/ovftool --help
```

The working directory within the container image is `/ovftool`.

Any commands that read file(s) will expect the file to exist in that directory.

Any commands that write file(s) will write to that directory.

You can mount any local directory to `/ovftool` by including it as a volume when running the container image, for example, `-v $HOME/ovftool:/ovftool`.

More documentation on the usage of ovftool can be found [here](https://code.vmware.com/tool/ovf).

The follow are `alias` commands to make life easier:

```bash
alias ovftool='podman run --rm -it -v $(pwd):/ovftool 0xcastleblack/ovftool'
```

If you are having issues with `podman` reading from a file within your `home` directory, use the following alias:

```bash
alias ovftool='podman run --rm -it -v $(pwd):/ovftool --security-opt label=disable 0xcastleblack/ovftool'
```

Should you be running Windows, you can try the same with [doskey](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/doskey). I have not tested this myself so YMMV.

```bash
doskey ovftool=docker run --rm -ti -v %cd%:/ovftool 0xcastleblack/ovftool $*
```
