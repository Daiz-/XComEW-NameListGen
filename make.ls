require 'shelljs/make'
require! {
  lsc: \LiveScript
}

target.all = ->
  console.log "Compiling LiveScript to JavaScript..."
  lsc.compile (cat \index.ls) .to "./bin/index.js"