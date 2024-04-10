package main

import (
	"crypto/md5"
	"encoding/hex"
	"errors"
	"io"
	"log"
	"net/http"
	"os"
	"path/filepath"

	"github.com/Kenshin/curl"
	"github.com/carlmjohnson/requests"
	"github.com/urfave/cli/v2"
)

type pingRepose struct {
	Message string `json:"message"`
}
type versions struct {
	Versions []string `json:"versions"`
}
type buildList struct {
	ProjectName    string   `json:"projectName"`
	ProjectVersion string   `json:"projectVersion"`
	Builds         []Builds `json:"builds"`
}
type Builds struct {
	Number       int    `json:"number"`
	GitSha       string `json:"gitSha"`
	ForgeVersion string `json:"forgeVersion"`
	FileMd5      string `json:"fileMd5"`
	OriginUrl    string `json:"originUrl"`
	Url          string `json:"url"`
	CreatedAt    int64  `json:"createdAt"`
}

func main() {
	app := new(cli.App)
	app.Name = "download-mohist"
	app.Usage = "Download minecraft server"
	app.Flags = []cli.Flag{
		&cli.StringFlag{
			Name:    "Version",
			Aliases: []string{"v", "VERSION", "version", "target-version"},
			Usage:   "pick a target version",
		},
		&cli.StringFlag{
			Name:    "Path",
			Aliases: []string{"p", "PATH", "path", "target-path"},
			Usage:   "specify the path to download",
		},
	}
	app.Action = func(c *cli.Context) error {
		version := c.String("Version")
		if version == "" {
			return errors.New("version is required")
		}
		pathRaw := c.String("Path")
		path := filepath.Clean(pathRaw)
		if pathRaw == "" {
			path = filepath.Clean("/app")
		}

		log.Printf("ok! mohist %s will be download to: %s\n", version, path)
		ping := new(pingRepose)
		_ = requests.
			URL("https://mohistmc.com").
			Path("api/v2/ping").
			ToJSON(&ping)
		if ping.Message != "pong" {
			return errors.New("api offline")
		}
		versionList := new(versions)
		_ = requests.
			URL("https://mohistmc.com").
			Path("api/v2/projects/mohist").
			ToJSON(&versionList)
		for index, v := range versionList.Versions {
			if version == v {
				break
			}
			if index == len(versionList.Versions)-1 {
				return errors.New("version not found")
			}
		}
		builds := new(buildList)
		var maxNumber int
		var maxBuild Builds
		for _, build := range builds.Builds {
			if build.Number > maxNumber {
				maxNumber = build.Number
				maxBuild = build
			}
		}
		httpStatusCode, resp, err := curl.Get(maxBuild.OriginUrl)
		if err != nil {
			return err
		}
		if httpStatusCode != http.StatusOK {
			return errors.New("Failed to download: " + maxBuild.OriginUrl)
		}
		BodyBytes, _ := io.ReadAll(resp.Body)
		if md5Obj := md5.New(); hex.EncodeToString(md5Obj.Sum(BodyBytes)) != maxBuild.FileMd5 {
			log.Fatalf("error: file verify failed!\nlocal MD5 is: %s\nbut remote MD5 is: %s", hex.EncodeToString(md5Obj.Sum(nil)), maxBuild.FileMd5)
		}
		log.Printf("write file to: %s/server.jar\n", path)
		err = os.WriteFile(path+"/server.jar", BodyBytes, 444)
		if err != nil {
			return err
		}
		return nil

	}
}
