# reference: https://hub.docker.com/r/nvidia/cuda/
FROM nvidia/cuda:9.2-devel-centos7

LABEL maintainer="John J. Lee <www.github.com/jjleewustledu>"

# Install Anaconda.
# Why Anaconda?  Its recommended Package Manager For PyTorch.
# The following section is from https://hub.docker.com/r/continuumio/anaconda3/~/dockerfile/
# You may have to check this periodically and update.

# set environment variables
#ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN yum update -y && \
    yum install -y wget bzip2 ca-certificates \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    git-core git mercurial subversion \
    build-essential \
    byobu \
    curl \
    htop \
    libcupti-dev \
    libfreetype6-dev \
    libpng12-dev \
    libzmq3-dev \
    pkg-config \
    python2-pip \
    python2-dev \
    python-virtualenv \
    rsync \
    software-properties-common \
    unzip && \
    yum clean all

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda2-2018.12-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

ENV PATH /opt/conda/bin:$PATH

RUN pip --no-cache-dir install --upgrade \
    altair vega_datasets notebook vega \
    sklearn-pandas

# open ports for Jupyter, SSH
EXPOSE 7745
EXPOSE 22

# setup filesystem
RUN mkdir ds
ENV HOME=/ds
ENV SHELL=/bin/bash
VOLUME /ds
WORKDIR /ds
ADD run_jupyter.sh /ds/run_jupyter.sh
RUN chmod +x /ds/run_jupyter.sh

CMD ["./run_jupyter.sh"]
