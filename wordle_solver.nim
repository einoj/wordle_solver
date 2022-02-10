import std/[strformat, sequtils, tables]
import wordlist

proc get_top_five_letters(wordseq: seq[string]): seq[char] = 
  var alphabet = initCountTable[char]()
  for word in wordseq:
    for letter in word:
      alphabet.inc(letter)
  alphabet.sort
  result =  toSeq(alphabet.keys)[0..4]

echo get_top_five_letters(words)
