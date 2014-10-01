![binpac-logo](https://raw.githubusercontent.com/blacktop/docker-binpac/master/logo.png)
HILTI and BinPAC++ Dockerfile
==================

This repository contains a **Dockerfile** of [HILTI and BinPAC++](http://www.icir.org/hilti/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/blacktop/binpac/) published to the public [Docker Registry](https://index.docker.io/).

### Dependencies

* [blacktop/bro](https://index.docker.io/u/blacktop/bro/)

### Image Sizes
| Image | Virtual Size | binpac v2.3.1| TOTAL     |
|:------:|:-----------:|:---------:|:---------:|
| debian | 114 MB      | 502.8 MB  | 616.8 MB  |

### Image Tags
```bash
$ docker images

REPOSITORY          TAG                 IMAGE ID           VIRTUAL SIZE
blacktop/binpac        latest
```

### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/blacktop/binpac/) from public [Docker Registry](https://index.docker.io/): `docker pull blacktop/binpac`

#### Alternatively, build an image from Dockerfile
```bash
$ docker build -t blacktop/binpac github.com/blacktop/docker-binpac
```
### Usage
```bash
$ docker run -i -t -v /path/to/folder/pcap:/pcap:rw blacktop/binpac
```
#### Output:
```bash
$
```
```bash
$
```
#### Or use your own pcap
```bash
$ docker run -it -v /path/to/pcap:/pcap:rw blacktop/binpac
```
### Todo
- [x] Install/Run BinPAC++
- [ ]
