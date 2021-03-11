FROM markuseggenbauer/me_cpp_dev

ENV DEBIAN_FRONTEND noninteractive

# ADG specific tools
RUN apt-get update && apt-get install -y \
    g++-8 \
    clang-format-10 \
    clang-tidy-10

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 50
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 50
RUN update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-10 50
RUN update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-10 50

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
    clang \
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

RUN pip3 install artifactory
RUN pip3 install paramiko

# development tools for user convenience
RUN apt-get update && apt-get install -y \
    bsdmainutils \
    iproute2 \
    inetutils-ping \
    tcpdump \
    strace

RUN conan profile new default --detect && \
    conan profile update settings.compiler.libcxx=libstdc++11 default && \
    conan profile update settings.compiler=gcc default && \
    conan profile update settings.compiler.version=8 default && \
    conan remote clean

