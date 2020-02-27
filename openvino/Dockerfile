# based on:
# https://docs.openvinotoolkit.org/latest/_docs_install_guides_installing_openvino_docker_linux.html
FROM ubuntu:18.04

USER root
WORKDIR /
RUN useradd -ms /bin/bash openvino && \
        echo "openvino:openvino" | chpasswd && adduser openvino sudo && \
        chown openvino -R /home/openvino

ARG DEPENDENCIES="autoconf \
                  automake \
                  build-essential \
                  cmake \
                  cpio \
                  curl \
                  gnupg2 \
                  libdrm2 \
                  libglib2.0-0 \
                  lsb-release \
                  libgtk-3-0 \
                  libtool \
                  python3-pip \
                  sudo \
                  udev \
                  unzip"

RUN apt-get update && \
        apt-get install -y --no-install-recommends ${DEPENDENCIES} && \
        rm -rf /var/lib/apt/lists/*

# install OpenVINO
ARG DOWNLOAD_LINK=http://registrationcenter-download.intel.com/akdlm/irc_nas/16345/l_openvino_toolkit_p_2020.1.023.tgz
WORKDIR /tmp
RUN curl -LOJ "${DOWNLOAD_LINK}" && \
        tar -xzf ./*.tgz && \
        cd l_openvino_toolkit* && \
        sed -i 's/decline/accept/g' silent.cfg && \
        echo "set COMPONENTS=intel-openvino-ie-rt-cpu__x86_64" >> silent.cfg && \
        ./install.sh -s silent.cfg && \
        rm -rf /tmp/*

ENV INSTALL_DIR /opt/intel/openvino
WORKDIR $INSTALL_DIR
RUN ./install_dependencies/install_openvino_dependencies.sh
RUN /bin/bash -c "source $INSTALL_DIR/bin/setupvars.sh"
RUN echo "source $INSTALL_DIR/bin/setupvars.sh" >> /root/.bashrc

# well done!
CMD ["/bin/bash"]
