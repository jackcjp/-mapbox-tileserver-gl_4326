![tileserver-gl](https://cloud.githubusercontent.com/assets/59284/18173467/fa3aa2ca-7069-11e6-86b1-0f1266befeb6.jpeg)


# TileServer GL
[![Build Status](https://travis-ci.org/maptiler/tileserver-gl.svg?branch=master)](https://travis-ci.org/maptiler/tileserver-gl)
[![Docker Hub](https://img.shields.io/badge/docker-hub-blue.svg)](https://hub.docker.com/r/maptiler/tileserver-gl/)

Vector and raster maps with GL styles. Server-side rendering by Mapbox GL Native. Map tile server for MapLibre GL JS, Android, iOS, Leaflet, OpenLayers, GIS via WMTS, etc.

## Get Started

Make sure you have Node.js version **10** installed (running `node -v` it should output something like `v10.17.0`).

Install `tileserver-gl` with server-side raster rendering of vector tiles with npm

```bash
npm install -g tileserver-gl
```

Now download vector tiles from [OpenMapTiles](https://data.maptiler.com/downloads/planet/).

```bash
curl -o zurich_switzerland.mbtiles https://[GET-YOUR-LINK]/extracts/zurich_switzerland.mbtiles
```

Start `tileserver-gl` with the downloaded vector tiles.

```bash
tileserver-gl zurich_switzerland.mbtiles
```

Alternatively, you can use the `tileserver-gl-light` package instead, which is pure javascript (does not have any native dependencies) and can run anywhere, but does not contain rasterization on the server side made with MapBox GL Native.

## Using Docker

An alternative to npm to start the packed software easier is to install [Docker](https://www.docker.com/) on your computer and then run in the directory with the downloaded MBTiles the command:

```bash
docker run --rm -it -v $(pwd):/data -p 8080:80 maptiler/tileserver-gl
```

This will download and start a ready to use container on your computer and the maps are going to be available in webbrowser on localhost:8080.

On laptop, you can use [Docker Kitematic](https://kitematic.com/) and search "tileserver-gl" and run it, then drop in the 'data' folder the MBTiles.

## Documentation

You can read the full documentation of this project at https://tileserver.readthedocs.io/.

## Alternative

Discover MapTiler Server if you need a [map server with easy setup and user-friendly interface](https://www.maptiler.com/server/).



需要把配置文件放在映射的目录中，在这里比如映射的是/data目录
配置文件路径结构为
/data/config.json
/data/gebco_polygon4osm.mbtiles
/data/resources/styles/gebco_polygon4osm/style.json

style 里面sources
用在线服务
  "sources": {
    "gebco_polygon4osm": {
      "type": "vector",
      "tiles": [
        "http://10.1.108.195:32527/data/gebco_polygon4osm/{z}/{x}/{y}.pbf"
      ],
      "minZoom": 0,
      "maxZoom": 11
    },
  },

或者用mbtiles服务
  "sources": {
    "gebco_polygon4osm": {
      "type": "vector",
      "url": "mbtiles://gebco_polygon4osm.mbtiles",
      "minZoom": 0,
      "maxZoom": 11
    },
  },

请求pbf的路径为
http://localhost:1234/data/gebco_polygon4osm/0/0/0.pbf


请求海图的地址为
http://localhost:1234/styles/gebco_polygon4osm/0/0/0.png
