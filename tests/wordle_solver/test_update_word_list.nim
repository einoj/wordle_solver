import ../../wordle_solver
import std/[sequtils, tables, lists]
import ../../wordlist

var wordllist = concat(fasitwords, guesswords).toDoublyLinkedList
var green_letters = {2:'a', 3:'n'}.toTable
let gray_letters = @['b','d','f','g','h','i','j','k','l','m','o','p','q','s','t','u','v','x','y','z']
update_word_list(gray_letters, @['c','r'], green_letters, wordllist)
let crane = ["crane"].toDoublyLinkedList
assert wordllist.toSeq.len == 1
assert "crane" in wordllist
