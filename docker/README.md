# Docker command
sample

## run
```bash
sudo docker run --name pytorch --runtime=nvidia  -it -p 8888:8888 -p 6006:6006 -v /work:/work pytorch/pytorch:latest
```

## exec
```bash
sudo docker exec -it pytorch bash
```
