# Jumble
#
# from: https://programmingpraxis.com/2019/03/01/jumble
#
# Last week I gave a rather silly solution to the Scrabble problem. Today’s
# exercise is my penance for that silliness.
#
# As I’ve mentioned previously, my day job is on a team of programmers that
# supports our enterprise-wide computer system. I sit in a cube farm, where
# there is neither audible nor visual privacy. We recently hired a new
# programmer to replace a retiring team member, and he has a daily calendar on
# his desk that provides a jumbled series of letters that you have to rearrange
# to form a word. Yesterday’s puzzle was L T E A D E; most of the puzzles I
# solve in a few seconds, but that one took several minutes. The calendar
# appears to have a flaw: the solutions, one day after the next, are in
# alphabetical order, so I know before I start that the first letter will be E.

# Your task is to write a program that solves jumbles.

def jumble(word, dict)
  chars = word.downcase.chars.sort
  dict.select do |w|
    w.chomp!
    chars.size == w.size && chars == w.downcase.chars.sort
  end
end

puts jumble(ARGV.first, File.readlines("/usr/share/dict/words"))