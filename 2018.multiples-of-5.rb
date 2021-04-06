# source: https://programmingpraxis.com/2018/06/12/multiples-of-5
#
# Multiples Of 5 by Programming Praxis
#
# We have today an interview question from Amazon:
#
# Write a program to determine if an integer is a multiple of 5 in O(log n) time
# complexity. You cannot use the division or modulus operators.

# Using built-in binary search
def multiple_of_5?(n)
  !!(0..n).bsearch { |x| n <=> (x * 5) }
end

# Using a modified binary search algorithm.
def multiple_of_5?(n)
  l = 0
  r = n
  while l <= r do
    m = (l + r) >> 1 # Divide by 2 by right-shifting 1 bit
    if m * 5 < n
      l = m + 1
    elsif m * 5 > n
      r = m - 1
    else
      return true
    end
  end
  false
end

# Test
r = 1000.times
  .map { rand(0..1000000) }
  .map { |n| [n, multiple_of_5?(n)] }
  .select { |n, s| (n % 5 == 0) != s }

if r.any?
  puts '❌'
  puts r.map(&:inspect)
else
  puts '✅'
end