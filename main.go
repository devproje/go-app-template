package main

import (
	"flag"
	"io"
	"os"

	"github.com/devproje/go-app-template/utils"
	"github.com/devproje/plog/level"
	"github.com/devproje/plog/log"
)

var debug bool

func init() {
	flag.BoolVar(&debug, "debug", false, "Service debug mode")
	flag.Parse()

	log.SetLevel(level.Info)
	log.SetOutput(io.MultiWriter(os.Stdout, utils.Logging()))
}

func main() {
	if debug {
		log.SetLevel(level.Debug)
		log.Warnln("You're now into debug mode. If you want a change production mode, please remove '-debug' flag.")
	}

	log.Infoln("Hello, Apps!")
}
