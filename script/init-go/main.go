package main

import (
	"os"
)

func action(fileInfo info) {
	fileStat, err := os.Stat(fileInfo.path)
	if fileStat.IsDir() {
		os.Remove(fileInfo.path)
	}
	switch os.IsNotExist(err) {
	case true:
		os.Remove(fileInfo.path)
	case false:
		os.Create(fileInfo.path)
		os.WriteFile(fileInfo.path, []byte(fileInfo.context), 644)
	}
}

type info struct {
	path    string
	context string
}

func main() {
	fileInfos := make([]info, 0)
	mem := info{path: "/app/memorysize.txt", context: "-Xms512M"}
	jvmArgs := info{path: "/app/userjvmargs.txt", context: "-nogui"}
	fileInfos = append(fileInfos, mem, jvmArgs)
	for _, fileInfo := range fileInfos {
		action(fileInfo)
	}
}
