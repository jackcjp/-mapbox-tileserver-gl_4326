#! /bin/bash
docker run -itd --name tileserver-gl-base_002 -m 2g --cpus=2  -v $(pwd):/data -p 9443:80 registry.cn-beijing.aliyuncs.com/geovis-base/tileserver-gl:latest 
