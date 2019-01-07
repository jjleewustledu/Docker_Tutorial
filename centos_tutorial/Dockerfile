# reference: https://hub.docker.com/_/centos/
FROM centos

LABEL maintainer="John J. Lee <www.github.com/jjleewustledu>"

# set environment variables
#ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# ensure security patches, project dependencies 
RUN yum update -y && yum install -y wget bzip2 ca-certificates \
    build-essential \
    byobu \
    curl \
    git-core \
    htop \
    pkg-config \
    python2-dev \
    python2-pip \
    python-setuptools \
    python-virtualenv \
    unzip \
    && \
yum clean all

CMD ["/bin/bash"]
