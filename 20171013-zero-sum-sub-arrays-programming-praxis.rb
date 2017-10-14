# source: https://programmingpraxis.com/2017/10/13/zero-sum-sub-arrays/
#
# Zero-Sum Sub-Arrays
#
# This interesting little question comes from Career Cup:
#
# Given an array that contains only the elements -1 and 1, find the number of
# sub-arrays with a sum of zero. For instance, given the array [-1, 1, -1, 1],
# there are four sub-arrays that sum to zero:
# [-1, 1], [1, -1], [-1, 1] and [-1, 1, -1, 1].
#
# Your task is to count the sub-arrays of a -1/1 array that sum to zero. When
# you are finished, you are welcome to read or run a suggested solution, or to
# post your own solution or discuss the exercise in the comments below.

def zero_sum_sub_arrays(xs)
  return 0 if xs.size < 2

  (2..xs.size)
    .flat_map { |n| xs.each_cons(n).to_a }
    .select { |xs| xs.sum == 0 }
    .size
end

# Test
5.times do |n|
  [1, -1].repeated_permutation(n).map do |input|
    puts "#{input} -> #{zero_sum_sub_arrays(input)}"
  end
end

__END__

Solution in Ruby

[sourcecode lang="ruby"]

def zero_sum_sub_arrays(xs)
  return 0 if xs.size < 2

  (2..xs.size)
    .flat_map { |n| xs.each_cons(n).to_a }
    .select { |xs| xs.sum == 0 }
    .size
end

# Test

5.times do |n|
  [1, -1].repeated_permutation(n).map do |input|
    puts "#{input} -> #{zero_sum_sub_arrays(input)}"
  end
end

[/sourcecode]

produces:

[sourcecode]

[] -> 0
[1] -> 0
[-1] -> 0
[1, 1] -> 0
[1, -1] -> 1
[-1, 1] -> 1
[-1, -1] -> 0
[1, 1, 1] -> 0
[1, 1, -1] -> 1
[1, -1, 1] -> 2
[1, -1, -1] -> 1
[-1, 1, 1] -> 1
[-1, 1, -1] -> 2
[-1, -1, 1] -> 1
[-1, -1, -1] -> 0
[1, 1, 1, 1] -> 0
[1, 1, 1, -1] -> 1
[1, 1, -1, 1] -> 2
[1, 1, -1, -1] -> 2
[1, -1, 1, 1] -> 2
[1, -1, 1, -1] -> 4
[1, -1, -1, 1] -> 3
[1, -1, -1, -1] -> 1
[-1, 1, 1, 1] -> 1
[-1, 1, 1, -1] -> 3
[-1, 1, -1, 1] -> 4
[-1, 1, -1, -1] -> 2
[-1, -1, 1, 1] -> 2
[-1, -1, 1, -1] -> 2
[-1, -1, -1, 1] -> 1
[-1, -1, -1, -1] -> 0

[/sourcecode]
