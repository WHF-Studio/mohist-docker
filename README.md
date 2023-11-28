# mohist-docker
为mohist量身定制的docker镜像，开箱即用

## 镜像地址

- 官方镜像：https://hub.docker.com/r/whfstudio/mohist-docker
## 镜像特点

- 基于alpine最新版
- 无需安装任何依赖
- 镜像大小只有18.3232 MiB左右
## 镜像使用

### 第一次使用

```bash
#代码仅为演示，请自行修改
# 创建数据目录
mkdir -p /data/mohist/ && cd /data/mohist/
# 设定内存大小
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
### docker compose
```yaml
# yaml版本
version: 3
# 环境变量
vars:
  minecraft_version: 1.12.2
# 服务
services:
  # 服务器名称
  minecraft:
    # 容器镜像地址，请不要改动
    image: whf-studio/mohist-docker:1.20.1
    container_name: mohist-1.20.1
    restart: always
    ports:
      - 25565:25565/tcp # 服务器端口
      - 25575:25575/tcp # RCON控制台端口
    volumes: /path/to/your/data:/app
```