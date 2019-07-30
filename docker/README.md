# Docker command
sample

## run
### pytorch
```bash
sudo docker run --name pytorch --runtime=nvidia  -it -p 8888:8888 -p 6006:6006 -v /work:/work pytorch/pytorch:latest
```

### kaggle
```bash
sudo docker run --runtime nvidia --name kaggle --rm -it -p 8889:8888 -p 6007:6006 -v /work:/work kaggle/python-gpu-build /bin/bash
pip3 uninstall tornado
pip3 install tornado==5.1.1
```


### GLUON
```bash
# SSHで接続することを前提としたコンテナ
# VS Code Remote を使用した開発を行いたいので
sudo docker build -t gluon .
sudo docker run --runtime nvidia --name gluon -d -p 22122:22 -v /work:/work gluon

# SSH接続先のDocker内のGUIアプリを、SSHのクライアント側で表示させる場合
sudo docker run --runtime nvidia --name gluon -it -v /work:/work \
  --net host \
  -e DISPLAY=$DISPLAY \
  -v $HOME/.Xauthority:/root/.Xauthority \
  gluon bash
```

### ROS
GUIを表示するための基本
```
docker run -it --rm \
  --user=$(id -u):$(id -g) \
  $(for i in $(id -G); do echo -n " --group-add "$i; done) \
  --env="DISPLAY" \
  --env=QT_X11_NO_MITSHM=1 \
  --workdir="/home/$USER" \
  --volume="/home/$USER:/home/$USER" \
  --volume="/etc/group:/etc/group:ro" \
  --volume="/etc/passwd:/etc/passwd:ro" \
  --volume="/etc/shadow:/etc/shadow:ro" \
  --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  osrf/ros:indigo-desktop-full rqt
```

## exec
```bash
sudo docker exec -it pytorch bash
```
