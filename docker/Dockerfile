FROM tensorflow/tensorflow:latest-gpu-py3

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install --no-install-recommends -y \
  vim wget curl git cmake build-essential libboost-dev \
  libboost-system-dev libboost-filesystem-dev

pip install keras jupyter
