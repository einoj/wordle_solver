import std/[strformat, sequtils, tables, lists, strutils]
import wordlist

proc get_top_five_letters(wordseq: seq[string]): seq[char] =
  var alphabet = initCountTable[char]()
  for word in wordseq:
    for letter in word:
      alphabet.inc(letter)
  alphabet.sort
  result =  toSeq(alphabet.keys)[0..4]


proc get_words_containing_letters(letters: seq[char], wordseq: seq[string]): DoublyLinkedList[string] =
  var list = initDoublyLinkedList[string]()
  for word in wordseq:
    var count = 0
    for letter in letters:
      if not (letter in word):
        break
      count += 1
    if count == len(letters):
      list.add(word)
  result = list

let top_five = get_top_five_letters(words)
echo top_five
echo get_words_containing_letters(top_five[0..3], words)

