# docker-nzcc-v2
Docker image containing Python software packages for coastal landcover classification and pixel based change detection from Sentinel composite images. To see packages view **requirements.txt**

## running workflow
```docker run -it -v /home/path/to/input/data:/data bcol845/nzcc-v2```

working on mac with apple silicon might require  extra flag **--platform**

```docker run -it --platform linux/amd64 -v /home/path/to/input/data:/data bcol845/nzcc-v2```



