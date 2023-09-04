package main

import (
	"flag"
	"fmt"
	"io"
	"os"

	"github.com/devproje/go-app-template/utils"
	"github.com/devproje/plog/level"
	"github.com/devproje/plog/log"
)

var mode string

func getMode() {
	switch mode {
	case "release":
		log.SetLevel(level.Info)
	case "debug":
		log.SetLevel(level.Debug)
		log.Warnln("You're now into debug mode. If you want a change production mode, please add flag '-mode=release'.")
	default:
		log.Fatalln(fmt.Sprintf("'%s' not available mode type. (available mode: release, debug)", mode))
	}
}

func init() {
	flag.StringVar(&mode, "mode", "debug", "Service debug mode")
	flag.Parse()

	getMode()
	log.SetOutput(io.MultiWriter(os.Stdout, utils.Logging()))
}

func main() {
	log.Infoln("Hello, Apps!")
}
