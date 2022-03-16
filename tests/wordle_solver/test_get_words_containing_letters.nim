import ../../wordle_solver
import std/[sequtils, lists]
import ../../wordlist

let top_five = get_top_five_letters(guesswords)
let wc = @["aeons", "aeros", "aloes", "oases", "oaves", "paseo", "psoae", "soare", "soave", "stoae", "toeas", "zoeas"]
assert get_words_containing_letters(top_five[0..3], guesswords).toSeq == wc
