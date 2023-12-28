#!/bin/bash
rm -rf /app/server.jar
cp /jbin/server.jar /app/server.jar
java -jar /app/server.jar @memorysize.txt @userjvmargs.txt -nogui
rm -rf /app/server.jar