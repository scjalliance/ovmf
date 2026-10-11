# Specify which EDK II tag to use.
ARG TAG=stable202305

# Derive our OVMF build environment from the EDK II build environment.
FROM scjalliance/edk2:${TAG}

# Inherit arguments.
ARG TAG

# Apply some labels to the image.
LABEL maintainer="Joshua Sjoding <joshua.sjoding@scjalliance.com>" \
      description="Build environment for Open Virtual Machine Firmware. Based on the TianoCore edk2-${TAG} tag."

# Configure EDK II to build OVMF.
ARG TARGET=RELEASE
ARG TARGET_ARCH=X64
ARG PLATFORM=OvmfPkg/OvmfPkgX64.dsc

WORKDIR /opt/src/edk2/Conf

RUN echo "TARGET                       = ${TARGET}" >> target.txt && \
    echo "TARGET_ARCH                  = ${TARGET_ARCH}" >> target.txt && \
    echo "ACTIVE_PLATFORM              = ${PLATFORM}" >> target.txt

WORKDIR /opt/src/edk2

# Support interactive usage.
CMD ["/bin/bash"]
