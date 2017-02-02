# https://programmingpraxis.com/2009/03/10/word-frequencies/
#
# Write a program that:
# 
# 1) takes a filename and a parameter n
# 2) prints the n most common words in the file
# 3) the count of their occurrences, in descending order.

text = File.read(ARGV[0])
n    = ARGV[1].to_i == 0 ? 1 : ARGV[1].to_i

puts text
  .scan(/\w+/)
  .group_by(&:itself)
  .sort_by  { |_, v| -v.size }
  .take(n)
  .map      { |k, v| "#{k}: #{v.size}" }
