# XCOM:EW Namelist Generator

A small command-line utility for generating a namelist file for XCOM: Enemy Within from a list of (nick)names.

## Installation

1. Make sure you have [node.js](http://nodejs.org) installed.
2. Run `npm install -g xcom-namegen` from the command line.

## Usage

```

    Usage: xcom-namegen [options] namefile

  Generate a XCOM: Enemy Within namelist file from a list of (nick)names.
  Namefile defaults to names.txt. Names are spread evenly across all countries
  unless the -d/--dupe option is specified.

  Options:

    -h, --help    Show this help.
    -o, --output  Output filename. [DefaultNameList.ini]
    -d, --dupe    Duplicate all names across all countries. [false]

```

After generating the `DefaultNameList.ini`, you should place it in in `[XCOM:EW Installation folder]\XEW\XComGame\Config\` - make sure to back up the original `DefaultNameList.ini` first! In case of an emergency, you can find the original [here](https://gist.github.com/Daiz-/8ca3c8848eaab8d0c695).

## Namefile

Your namefile (`names.txt` by default) should have the following format:

```
name1
name2
name3
name4
```

And so on. One name per line with nothing else. Avoid using quotes (`"`). These names will be used as last names in the game, with the first names left empty for everyone. If you don't have a lot of names, usage of the `-d/--dupe` option is recommended.