#/bin/sh
# -*- coding: utf-8 -*-
# 更换镜像源
$mcversion=$1
sed -i 's/dl-cdn.alpinelinux.org/opentuna.cn/g' /etc/apk/repositories
# 安装依赖
apk add --no-cache curl jq
# 探测api连通连通性(这个地方等待修复)
# pingjson=$(curl -b "no-tracking=1" -S /dev/stderr -X 'GET' 'https://mohistmc.com/api/v2/ping' -H 'accept: application/json')
# pingresult=$(echo $pingjson | jq '.message')
# if [ "$pingresult"  "pong" ]; then
#   echo "API连接正常"
# else
#   echo "API连接异常"
#   exit 1
# fi
# 获取数据
latestjson=$(curl -b "no-tracking=1" -S /dev/stderr -X 'GET' 'https://mohistmc.com/api/v2/projects/mohist/1.12.2/builds' -H 'accept: application/json' | jq -r '.builds | sort_by(.number) | last')
# 解析下载地址，获取md5
fileMd5=$(echo $latestjson | jq -r '.file_md5')
fileUrl=$(echo $latestjson | jq -r '.url')
curl -o /app/server.jar $fileUrl
# 校验md5
localMd5=$(md5sum /app/server.jar)
if [ "$localMd5"!= "$fileMd5" ]; then
  echo "文件损坏！md5校验失败"
  exit 1
  else
  echo 文件校验成功，云端md5为$fileMd5，本地md5为$localMd5，确认一致
fi
# 清理
apk del curl jq