#!/bin/sh
ln -s /jbin/* /app/*
java -jar server.jar @memorysize.txt @userjvmargs.txt -nogui
cp -rn /jbin/* /app/*