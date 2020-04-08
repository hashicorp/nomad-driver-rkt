package main

import (
	log "github.com/hashicorp/go-hclog"

	"github.com/hashicorp/nomad-driver-rkt/rkt"
	"github.com/hashicorp/nomad/plugins"
)

func main() {
	// Serve the plugin
	plugins.Serve(factory)
}

// factory returns a new instance of the Rkt driver plugin
func factory(log log.Logger) interface{} {
	return rkt.NewRktDriver(log)
}
