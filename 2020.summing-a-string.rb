# 2020-06-26
#
# Summing A String
#
# In a string consisting of digits and other non-digit characters, the digits
# form an embedded series of positive integers. For instance, the string
# "123abc45def" contains the embedded integers 123 and 45, which sum to 168.
#
# Your task is to write a program that takes a string and writes the sum of the
# integers embedded in the string. When you are finished, you are welcome to
# read or run a suggested solution, or to post your own solution or discuss the
# exercise in the comments below.
#
# source: https://programmingpraxis.com/2020/06/19/summing-a-string/

def sum_string(str)
  str.scan(/\d+/).map(&:to_i).sum
end

# Another version without regexes
def sum_string2(str)
  numbers = '0123456789'
  sum = 0
  digit_str = ""

  str.chars.each do |char|
    if numbers.include?(char)
      digit_str << char
    elsif !digit_str.empty?
      sum += digit_str.to_i
      digit_str = ""
    end
  end

  if !digit_str.empty?
    sum += digit_str.to_i
  end

  sum
end

# Tests

def test(meth, args, target)
  output = meth.call(*args)
  puts "input: #{args.inspect}"
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target ? '✅' : '❌'}"
end

test method(:sum_string), [''], 0
test method(:sum_string), ['123abc45def'], 168
test method(:sum_string), ['2020-06-26'], 2052

test method(:sum_string2), [''], 0
test method(:sum_string2), ['123abc45def'], 168
test method(:sum_string2), ['2020-06-26'], 2052
