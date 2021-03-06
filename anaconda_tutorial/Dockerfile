# reference: https://hub.docker.com/_/centos/
FROM centos

LABEL maintainer="John J. Lee <www.github.com/jjleewustledu>"

# set environment variables
#ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN yum update -y && \
    yum install -y wget bzip2 ca-certificates \
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

# open ports for Jupyter
EXPOSE 7745

# setup filesystem
RUN mkdir ds
ENV HOME=/ds
ENV SHELL=/bin/bash
VOLUME /ds
WORKDIR /ds
ADD run_jupyter.sh /ds/run_jupyter.sh
RUN chmod +x /ds/run_jupyter.sh

CMD ["./run_jupyter.sh"]
