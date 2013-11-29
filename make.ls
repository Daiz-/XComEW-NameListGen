require 'shelljs/make'
require! {
  lsc: \LiveScript
}

target.all = ->
  console.log "Compiling LiveScript to JavaScript..."
  script = lsc.compile cat \index.ls
  ("#!/usr/bin/env node\n\n" + script).to "index.js"