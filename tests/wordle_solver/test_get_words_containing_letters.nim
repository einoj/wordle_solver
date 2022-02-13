import ../../wordle_solver
import std/[sequtils, lists]
import ../../wordlist

let top_five = get_top_five_letters(words)
let wc = @["adore", "arose", "opera"]
assert get_words_containing_letters(top_five[0..3], words).toSeq == wc
