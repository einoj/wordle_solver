import std/[sequtils, tables, lists]
import wordlist

proc get_top_five_letters*(wordseq: seq[string]): seq[char] =
  var alphabet = initCountTable[char]()
  for word in wordseq:
    for letter in word:
      alphabet.inc(letter)
  alphabet.sort
  result =  toSeq(alphabet.keys)[0..4]


proc get_words_containing_letters*(letters: seq[char], wordseq: seq[string]): DoublyLinkedList[string] =
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


## remove words containing any gray letters, remove words NOT containing yellow letters
## and remove words not containing green letter 'key' in position 'value' of word
proc update_word_list*(gray_letters: seq[char],  yellow_letters: seq[char], green_letters: TableRef[char, int], words: var DoublyLinkedList[string]) =
  for word in nodes(words):
    for letter in gray_letters:
      if letter in word.value:
        words.remove(word)
    for letter in yellow_letters:
      if not (letter in word.value):
        words.remove(word)
    for key in keys(green_letters):
      if not (word.value[green_letters[key]] == key):
        words.remove(word)
