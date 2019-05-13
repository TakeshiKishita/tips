# Docker command
sample

## run
```bash
# pytorch
sudo docker run --name pytorch --runtime=nvidia  -it -p 8888:8888 -p 6006:6006 -v /work:/work pytorch/pytorch:latest

# kaggle
sudo docker run --runtime nvidia --name kaggle --rm -it -p 8889:8888 -p 6007:6006 -v /work:/work kaggle/python-gpu-build /bin/bash
```

## exec
```bash
sudo docker exec -it pytorch bash
```
