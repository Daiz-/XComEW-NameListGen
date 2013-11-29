require 'shelljs/global'
argv = require \optimist
  .options \h do
    alias: \help
    default: false
  .options \o do
    alias: \output
    default: "DefaultNameList.ini"
  .options \d do
    alias: \dupe
    default: false
  .argv

usage = """
\n    Usage: xcom-namegen [options] namefile

  Generate a XCOM: Enemy Within namelist file from a list of (nick)names.
  Namefile defaults to names.txt. Names are spread evenly across all countries
  unless the -d/--dupe option is specified.

  Options:

    -h, --help    Show this help.
    -o, --output  Output filename. [DefaultNameList.ini]
    -d, --dupe    Duplicate all names across all countries. [false]

"""

if argv.help
  console.log usage
  process.exit 0

name = argv._.0 or "names.txt"
if not test \-f name
  console.log "Error: Input file not found. Showing help.\n#usage"
  process.exit 1

names = cat name .replace /\r\n|\r/g '\n' .split '\n'

# List of countries
countries = <[ Am Rs Ch In Af Mx Ab En Fr Gm Au It Jp Is Es Gr Nw Ir Sk Du Sc Bg Pl ]>
doubled = /^(Rs|Pl)$/

out = "[XComGame.XGCharacterGenerator]\n"
for c in countries
  out += """
  m_arr#{c}MFirstNames=""
  m_arr#{c}FFirstNames=""

  """

# shuffle an array with Fisher-Yates
shuffle = ->
  arr = it.slice! # copy the array instead of modifying the original
  m = arr.length
  while m
    i = Math.floor Math.random! * m--
    t = arr[m]
    arr[m] = arr[i]
    arr[i] = t

  arr

country-queue = shuffle countries
last-country = void

next-country = ->
  if not country-queue.length
    country-queue := shuffle countries
    while country-queue.0 is last-country
      country-queue := shuffle countries
  last-country := country-queue.pop!


insert = !(n, c) ->
  if doubled.test c
    out += """
    m_arr#{c}MLastNames="#{n}"
    m_arr#{c}FLastNames="#{n}"

    """
  else
    out += """m_arr#{c}LastNames="#{n}"\n"""

for n in names
  if argv.dupe
    for c in countries
      insert n, c
  else
    insert n, next-country!

console.log "Namefile generated and saved to #{argv.output}"
out.to argv.output



