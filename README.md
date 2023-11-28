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
    volumes: /path/to/your/data:/app
```