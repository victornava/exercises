# https://programmingpraxis.com/2016/10/11/three-list-manipulation-exercises
# 
# Three List Manipulation Exercises
#
# Task 1
# Write a function that takes a linked list of integers and returns a new linked
# list with all the odd integers removed.
#
# Task 2
# Write a function that removes every nth item from a linked list.
#
# Task 3
# Write a function that reverses the two halves of a list; if the number of items
# in the list is odd, the middle element should go with the second half of the li

# Task 1
def drop_odds(list)
  list.reject(&:odd?)
end

# Task 2
def remove_every_nth_item(n, list)
  list.each_slice(n).map { |l| l.take(n-1) }.flatten
end

# Task 3
def reverse_two_halves(list)
  n = list.size / 2
  [list.take(n), list.drop(n)].reverse.flatten
end

def test(method, input, target)
  output = self.send(method, *input)
  puts method.to_s
  puts "input: #{input}"
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target}"
  puts
end

test(:drop_odds, [(1..20).to_a], [2, 4, 6, 8, 10, 12, 14, 16, 18, 20])
test(:remove_every_nth_item, [3, (1..20).to_a], [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20])
test(:reverse_two_halves, [(1..10).to_a], [6, 7, 8, 9, 10, 1, 2, 3, 4, 5])
test(:reverse_two_halves, [(1..9).to_a], [5, 6, 7, 8, 9, 1, 2, 3, 4])