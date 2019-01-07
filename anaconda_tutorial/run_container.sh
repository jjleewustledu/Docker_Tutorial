#! /bin/bash

docker run -it --name anaconda-container --rm --net=host -v ${HOME2}/Docker/Docker_Tutorial/anaconda_tutorial/:/ds anaconda-image
