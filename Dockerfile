FROM markuseggenbauer/me_cpp_dev:main-latest
# Source: https://github.com/markuseggenbauer/cpp_dev_container/blob/main/.devcontainer/Dockerfile

ENV DEBIAN_FRONTEND noninteractive
USER root

# ADG specific tools
RUN apt-get update && apt-get install -y \
    pkg-config \
    libsystemd-dev \
    zlib1g-dev \
    openjdk-8-jdk \
    g++-8 \
    clang-format-10 \
    clang-tidy-10

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 50 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 50 && \
    update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-10 50 && \
    update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-10 50 && \
    update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# ADG doc design dependenciess
RUN apt-get update && apt-get install -y \
    asciidoctor \
    plantuml \
    graphviz \
    clang \
    python3-yaml \
    python3-jinja2 \
    python3-jsonschema \
    python3-clang \
    xsltproc \
    libsaxon-java \
    docbook-xsl \
    fop \
    libfontconfig1-dev \
    libfreetype6-dev

# development tools for user convenience
RUN apt-get update && apt-get install -y \
    bsdmainutils \
    iproute2 \
    inetutils-ping \
    tcpdump \
    strace
