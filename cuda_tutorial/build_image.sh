#! /bin/bash

nvidia-docker build -t cuda-image -f ${HOME2}/Docker/Docker_Tutorial/cuda_tutorial/Dockerfile ${HOME2}/Docker/Docker_Tutorial/cuda_tutorial
