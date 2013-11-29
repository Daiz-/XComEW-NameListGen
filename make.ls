require 'shelljs/make'
require! {
  lsc: \LiveScript
}

target.all = ->
  console.log "Compiling LiveScript to JavaScript..."
  if not test \-e \bin then mkdir \bin
  lsc.compile (cat \index.ls) .to "./bin/index.js"