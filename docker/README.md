# Docker command
sample

## run
```bash
# pytorch
docker run --name pytorch --runtime=nvidia  -it -p 8888:8888 -p 6006:6006 -v /work:/work pytorch/pytorch:latest

# kaggle
docker run --runtime nvidia --rm -it -p 8888:8888 -p 6006:6006 -v /work:/work kaggle/python-gpu-build /bin/bash
# GLUON
# SSHで接続することを前提としたコンテナ
# VS Code Remote を使用した開発を行いたいので
docker build -t gluon .
docker run --runtime nvidia --name gluon -d -p 22122:22 -v /work:/work gluon

# GUIアプリをSSHクライアント側で見る
docker run --runtime nvidia --name gluon -it -v /work:/work
  --net host \
  -e DISPLAY=$DISPLAY \
  -v $HOME/.Xauthority:/root/.Xauthority \
  gluon bash


```



## exec
```bash
sudo docker exec -it pytorch bash
```
