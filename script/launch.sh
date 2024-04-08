#!/bin/bash
rm -rf /app/server.jar
cp /jbin/server.jar /app/server.jar
echo eula=true > /app/eula.txt
java -jar /app/server.jar @memorysize.txt @userjvmargs.txt -nogui
rm -rf /app/server.jar