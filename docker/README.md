# Docker command
sample

## run
```bash
# pytorch
sudo docker run --name pytorch --runtime=nvidia  -it -p 8888:8888 -p 6006:6006 -v /work:/work pytorch/pytorch:latest

# kaggle
sudo docker run --runtime nvidia --name kaggle --rm -it -p 8889:8888 -p 6007:6006 -v /work:/work kaggle/python-gpu-build /bin/bash
pip3 uninstall tornado
pip3 install tornado==5.1.1

# GLUON
# SSHで接続することを前提としたコンテナ
# VS Code Remote を使用した開発を行いたいので
sudo docker build -t gluon .
sudo docker run --runtime nvidia --name gluon -d -p 22122:22 -v /work:/work gluon

```


## exec
```bash
sudo docker exec -it pytorch bash
```
