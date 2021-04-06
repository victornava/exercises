# source: https://programmingpraxis.com/2018/05/15/sum-embedded-numbers/
#
# Sum Embedded Numbers by programmingpraxis
#
# Given a string containing embedded numbers, find the sum of the embedded
# numbers. For instance, given the string "11aa22bb33cc44", the desired sum is
# 11 + 22 + 33 + 44 = 110. You may not use regular expressions.

def sum_embedded_numbers_imperatively(str)
  sum = 0
  current_val = nil

  str.chars do |c|
    if (Integer(c) rescue false)
      current_val = current_val ? current_val << c : c
    elsif current_val
      sum += current_val.to_i
      current_val = nil
    end
  end
  sum += current_val.to_i
  sum
end

def sum_embedded_numbers_functionaly(str)
  str
    .chars
    .chunk  { |char| (!!Integer(char) rescue false) }
    .select { |is_number, _| is_number }
    .sum    { |_,v| v.join.to_i }
end

# Test

def test(output, input, target)
  puts
  puts "input: #{input.inspect}"
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target ? '✅' : '❌'}"
end

[
  ["foo", 0],
  ["42", 42],
  ["-42", 42],
  ["-42-", 42],
  ["1-2-3-4", 10],
  ["1     2,    3;    4.  ", 10],
  ["11aa22bb33cc44", 110]
].each do |subject, target|
  test sum_embedded_numbers_functionaly(subject), subject, target
  test sum_embedded_numbers_imperatively(subject), subject, target
end