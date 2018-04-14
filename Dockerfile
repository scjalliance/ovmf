# Specify which upstream EDK2 branch to use
ARG BRANCH=latest

# Derive our OVMF build environment from the EDK2 build environment
FROM scjalliance/edk2:${BRANCH}

# Specify some labels
LABEL maintainer="Joshua Sjoding <joshua.sjoding@scjalliance.com>" \
      description="Build environment for Open Virtual Machine Firmware. Follows the TianoCore EDK II ${BRANCH} branch."

# Configure EDK2 to build OVMF
ARG TARGET=RELEASE
ARG TARGET_ARCH=X64
ARG PLATFORM=OvmfPkg/OvmfPkgX64.dsc

WORKDIR /opt/src/edk2/Conf

RUN echo "TARGET                       = ${TARGET}" >> target.txt && \
    echo "TARGET_ARCH                  = ${TARGET_ARCH}" >> target.txt && \
    echo "ACTIVE_PLATFORM              = ${PLATFORM}" >> target.txt

WORKDIR /opt/src/edk2

# Support interactive usage
CMD ["/bin/bash"]
