import ../../wordle_solver
import ../../wordlist

## Test get_top_five_letters
let top_five = get_top_five_letters(words)
assert top_five == @['e', 'a', 'r', 'o', 't']