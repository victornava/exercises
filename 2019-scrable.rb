# Scrabble by Programming Praxis
#
# Today's task is based on the game of Scrabble.
#
# Your task is to write a program to find the dictionary words of length 2 to 7
# that can be formed from the letters Q O F T H E A. When you are finished, you
# are welcome to read or run a suggested solution, or to post your own solution
# or discuss the exercise in the comments below.

# words from: http://www.mieliestronk.com/corncob_lowercase.txt

# First pass
def scrable
  regex = /^[qofthea]+$/
  STDIN.read
    .split(/[\n\r]+/)
    .select do |w|
      w.chars.size >= 2 &&
      w.chars.size <= 7 &&
      w =~ regex
    end
end

# Second pass after seeing this:
# https://programmingpraxis.com/2019/02/22/scrabble/#comment-79466
# Globules said
# February 23, 2019 at 4:29 AM
# $ egrep -i '^[qofthea]{2,7}$' /usr/share/dict/words | column -c 80

def scrable2
  STDIN.read.split(/[\n\r]+/).select { |l| l =~ /^[qofthea]{2,7}$/i }
end

puts scrable2

# test like this:
#   cat /usr/share/dict/words | ruby scrable.rb | column -c 80
