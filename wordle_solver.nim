import std/[sequtils, tables, lists, strformat, strutils, rdstdin]
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

proc get_grayyellow_user_input(gray: bool = false): seq =
    var line: string
    var color: string = "yellow"
    if gray:
      color =  "gray"
    let ok = readLineFromStdin(fmt"Enter {color} letters: ", line)
    result = line.rsplit(" ")
    
  
proc get_green_user_input*():  TableRef[char, int] =
    result = newTable[char, int]({'a': 2, 'e':4})

#while wordllist.toSeq.len > 1:
echo  get_grayyellow_user_input(true)
echo  get_green_user_input()
