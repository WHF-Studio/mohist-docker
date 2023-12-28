#!/bin/sh
sed -i 's/dl-cdn.alpinelinux.org/opentuna.cn/g' /etc/apk/repositories
apk add --no-cache bash
if [ -f "/app/memorysize.txt" ]
    then
    echo "Using memorysize from /app/memorysize.txt"
    else
    touch /jbin/memorysize.txt
    fi
if [ -f "/app/userjvmargs.txt" ]
    then
    echo "Using userjvmargs from /app/userjvmargs.txt"
    else
    touch /jbin/userjvmargs.txt
    fi