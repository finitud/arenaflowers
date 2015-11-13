My solution for a coding exercise for Arena Flowers.

# Notes

* The solution is contained in a git repository, in order to preserve the history. Files
for Ruby versioning with `rvm` are provided.

* The assignment is simple enough that a short script is the most simple, efficient, and
straightforward approach. This script can be found in the initial commit of the repo, and
is probably the most elegant solution.

* Since the objective of the exercise is also to evaluate use of TDD and OOD, this
script has been used as a starting point, with TDD used to guide a further refactoring.
Following steps would be to move the additional logic remaining in `parser.rb` to the
presenter classes, and leave only very basic logic in the script.
