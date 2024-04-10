# mohist-docker
为mohist量身定制的docker镜像，开箱即用
## 镜像地址
- 官方镜像：https://hub.docker.com/r/whfstudio/mohist-docker
## 镜像特点
- 基于alpine最新版，无任何冗余
- 基于azul zulu jre headless，性能好，占用小，启动快
- 内置了mohist启动脚本，无需手动配置
- 将内存配置和jvm配置内化到`/您的数据目录/userjvmargs.txt`和`/您的数据目录/usermemorysize.txt`中，修改方便快捷
- 完全开箱即用
- 无需安装任何依赖
- 镜像大小只有18.3232 MiB左右
## 快速开始
<b>
<font color=#7bf081>
tips: 默认为你的世界单独创建一个卷
</font>
</b>

- GNU/Linux:
```bash
# 直接复制黏贴到终端即可
mkdir -p /srv/minecraft/mohist
curl -L https://raw.githubusercontents.com/WHF-Studio/mohist-docker/main/docker-compose-single-server.yml -o /srv/minecraft/mohist/docker-compose.yml
cd /srv/minecraft/mohist
docker-compose up -d

```
- Windows:
```PowerShell
# 首先安装 docker desktop 并启动
# 然后复制黏贴到PowerShell即可
Cereate-Item -ItemType Directory -Force -Path "C:\Users\Administrator\minecraft\mohist"
Invoke-WebRequest -Uri https://raw.githubusercontents.com/WHF-Studio/mohist-docker/main/docker-compose-single-server.yml -OutFile "C:\Users\Administrator\minecraft\mohist\docker-compose.yml"
Set-Location "C:\Users\Administrator\minecraft\mohist"
docker-compose up -d
```
MacOS:
```zsh
curl -q "https://s3.opensuse-project.net/paste-o-o/hg50pl2tg8qb4of5afqqu0d6nxzx?response-content-disposition=inline%3B%20filename%3D%22e70e8569b57ab41048571e21edacafc1.txt%22%3B%20filename%2A%3DUTF-8%27%27e70e8569b57ab41048571e21edacafc1.txt&response-content-type=text%2Fplain&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=YI5KOnADj6WdQSae%2F20231228%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231228T154417Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=759d52f655c21b3eae3ffe36c1fa0284eae3c3e95188cf92f8c6cd4940ee8194" | echo
```
## 构建状态
[![1.12.2-publish](https://github.com/WHF-Studio/mohist-docker/actions/workflows/build-1.12.2.yml/badge.svg?branch=main)](https://github.com/WHF-Studio/mohist-docker/actions/workflows/build-1.12.2.yml)

[![1.16.5-publish](https://github.com/WHF-Studio/mohist-docker/actions/workflows/build-1.16.5.yml/badge.svg?branch=main)](https://github.com/WHF-Studio/mohist-docker/actions/workflows/build-1.16.5.yml)

[![1.18.2-publish](https://github.com/WHF-Studio/mohist-docker/actions/workflows/build-1.18.2.yml/badge.svg?branch=main)](https://github.com/WHF-Studio/mohist-docker/actions/workflows/build-1.18.2.yml)

[![1.19.2-publish](https://github.com/WHF-Studio/mohist-docker/actions/workflows/build-1.19.2.yml/badge.svg?branch=main)](https://github.com/WHF-Studio/mohist-docker/actions/workflows/build-1.19.2.yml)

[![1.20.1-publish](https://github.com/WHF-Studio/mohist-docker/actions/workflows/build-1.20.1.yml/badge.svg?branch=main)](https://github.com/WHF-Studio/mohist-docker/actions/workflows/build-1.20.1.yml)

## 镜像使用
### 第一次使用
```bash
#代码仅为演示，请自行修改
# 创建数据目录
mkdir -p /data/mohist/ && cd /data/mohist/
# 设定内存大小，请自行决定
echo -Xmx1024M -Xms1024M > memorysize.txt
# 设定jvm参数
echo -server > userjvmargs.txt
# 启动
docker run --rm -ditp 25565:25565 \
-p 25575:25575 \
-v /data/mohist/:/app/ \
--name mohist \
whfstudio/mohist-docker:1.20.1 \
```
### 后续使用
```bash
docker run --rm -ditp 25565:25565 \
-p 25575:25575 \
-v /data/mohist/:/app/ \
--name mohist \
whfstudio/mohist-docker:1.20.1 \
```
### docker compose 使用
```yaml
# 推荐阅读仓库内的 docker-compose.yml.example
# yaml版本
version: 3
# 环境变量
vars:
  minecraft_version: 1.20.1
# 服务
services: # 注：使用 Bungeecord 等跨服端时需要直接填写外网地址，否则将无法连接
  # 服务器名称
  minecraft:
    # 容器镜像地址，请不要改动
    image: whf-studio/mohist-docker:1.20.1
    container_name: mohist-1.20.1
    restart: unless-stopped
    ports:
      - 25565:25565/tcp # 服务器端口
      - 25575:25575/tcp # RCON 控制台端口
    volumes: /pathRaw/to/your/data:/app
```