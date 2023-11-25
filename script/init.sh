#!/bin/sh
if [ -f "/app/memorysize.txt" ]
    then
    echo "Using memorysize from /app/memorysize.txt"
    else
    touch /app/memorysize.txt
    fi
if [ -f "/app/userjvmargs.txt" ]
    then
    echo "Using userjvmargs from /app/userjvmargs.txt"
    else
    touch /app/userjvmargs.txt
    fi