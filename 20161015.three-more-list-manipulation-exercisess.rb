# https://programmingpraxis.com/2016/10/14/three-more-list-manipulation-exercises/
#
# THREE MORE LIST MANIPULATION EXERCISES
#
# We have three more list-manipulation exercises today, for those students midway
# through their beginning programming course who need practice with linked lists:
#
# Task 1
# Define a function that takes two lists, the second of which is a list of
# non-negative integers the same length as the first list, and returns a list of
# elements from the first list, in reverse order, each repeated a number of times
# as specified by the corresponding element of the second list.
#
# Task 2
# Rearrange the integers in a list so that all the odd numbers appear before all
# the even numbers, with both odd and even numbers in the same relative order in
# the output as they were in the input.
#
# Task 3
# Write a function that returns the nth item from the end of a list.

def task_1(a, b)
  a.zip(b).flat_map { |x, n| Array.new(n, x) }.reverse
end

def task_2(list)
  list.partition(&:odd?).flatten
end

def task_3(list, n)
  list.reverse[n]
end

# TEST
def test(output, target)
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target}"
  puts
end

puts "Task 1"
test task_1(%w[a b c], [1,2,3]), %w[c c c b b a]
test task_1(%w[d c b a], [3,0,0,1]), %w[a d d d]

puts "Task 2"
test task_2((1..20).to_a), [1,3,5,7,9,11,13,15,17,19,2,4,6,8,10,12,14,16,18,20]

puts "Task 3"
test task_3((1..20).to_a, 5), 15

__END__

SUBMISSION

[sourcecode lang="ruby"]

def task_1(a, b)
  a.zip(b).flat_map { |x, n| Array.new(n, x) }.reverse
end

def task_2(list)
  list.partition(&:odd?).flatten
end

def task_3(list, n)
  list.reverse[n]
end

[/sourcecode]