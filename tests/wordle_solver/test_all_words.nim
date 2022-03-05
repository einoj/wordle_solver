import ../../wordlist
import ../../wordle_solver
import std/[strutils, sequtils, strformat, tables, random, lists]


proc match(guess: string, fasit: string, gray: var  seq[char],  yellow: var seq[char], green: var Table[int, char]): bool =
  for i,letter in guess:
    if letter == fasit[i]:
      green[i] = letter
    elif not (letter in fasit):
      gray.add(letter)
    elif letter in fasit:
      yellow.add(letter)
  if len(green) == 5:
    result = true

var gray: seq[char] = @[]
var yellow: seq[char] = @[]
var green = initTable[int, char]()
var ret : bool

var wordllist = words.toDoublyLinkedList
var wordseq : seq[string]
var top_five : seq[char]
var top_words : seq[string]
var index: int
var guess_cnt : int = 0
var total_guesses = 0

for word in words:
  guess_cnt = 0
  gray = @[]
  yellow = @[]
  green.clear
  wordllist = words.toDoublyLinkedList
  #echo fmt"fasit = {word}"
  while true:
    wordseq = wordllist.toSeq
    top_five = get_top_five_letters(wordseq)
    top_words = @[]
    var j = top_five.len-1
    while top_words.len == 0:
      top_words = get_words_containing_letters(top_five[0..j], wordseq).toSeq
      j -= 1
    if top_words.len > 0:
      index = rand(top_words.len-1)
    guess_cnt += 1
    #echo fmt"guessing {top_words[index]}"
    ret = match(top_words[index], word, gray, yellow, green)
    if ret:
      break
    update_word_list(gray, yellow, green, wordllist)
  #echo fmt"Answer: {wordllist} guessed in {guess_cnt} tries"
  total_guesses += guess_cnt

let average_guesses = total_guesses/words.len
echo fmt"Average guesses: {average_guesses}, Total guesses: {total_guesses}"
assert average_guesses < 4.3
