FROM markuseggenbauer/me_cpp_dev

USER root

ARG USERNAME=developer
ENV DEBIAN_FRONTEND noninteractive

# development tools for user convenience
RUN apt-get update && apt-get install -y \
    sudo \
    bsdmainutils \
    iproute2 \
    inetutils-ping \
    tcpdump \
    strace

# ADG specific tools
RUN apt-get update && apt-get install -y \
    make \
    g++-8 \
    gcovr \
    clang-format-10 \
    clang-tidy-10


# additional ara_cli tools
RUN apt-get update && apt-get install -y \
    autoconf \
    libtool \
    python \
    tclsh

# adg dependencies
RUN apt-get update && apt-get install -y \
    pkg-config \
    libsystemd-dev \
    zlib1g-dev \
    openjdk-8-jdk

RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
# ADG doc design dependenciess
RUN apt-get update && apt-get install -y \
    doxygen \
    asciidoctor \
    graphviz \
    python3 \
    python3-yaml \
    python3-jinja2 \
    python3-jsonschema \
    python3-clang \
    xsltproc \
    libsaxon-java \
    docbook-xsl \
    fop \
    libpng-dev \
    libc6-dev \
    libfontconfig1-dev \
    libfreetype6-dev

RUN pip3 install conan --no-warn-script-location
RUN pip3 install artifactory
RUN pip3 install paramiko

RUN adduser ${USERNAME} sudo
RUN echo "%sudo  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
