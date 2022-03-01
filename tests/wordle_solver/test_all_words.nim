import ../../wordlist
import std/strutils
import std/sequtils
import std/strformat
import std/tables


proc match(guess: string, fasit: string, gray: var  seq[char],  yellow: var seq[char], green: var Table[char, int]): bool =
  for i,letter in guess:
    if not (letter in fasit):
      gray.add(letter)
    elif letter == fasit[i]:
      green[letter] = i
    elif letter in fasit:
      yellow.add(letter)
  if len(green) == 5:
    result = true

var gray: seq[char] = @[]
var yellow: seq[char] = @[]
var green = initTable[char, int]()
let ret = match("freda", "freda", gray, yellow, green)

echo ret
