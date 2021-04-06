# source: http://programmingpraxis.com/2017/08/15/phone-numbers/
#
# Phone Numbers by programmingpraxis Today's task looks like homework:
#
# Make a list of n-digit phone numbers according to the following rules:
#
# 1) First digit must not be zero.
# 2) First digit may be four, but no digits after the first may be four.
# 3) Any two consecutive digits must be different.
# 4) The user may specify any set of digits that may not appear in the phone number.
#
# For instance, if n = 3 and the digits 1, 3, 5, 7, and 9 don't appear in the output, the desired
# list of three-digit numbers starting with 2, 4, 6, or 8 followed by 0, 2, 6 or 8 without
# consecutive duplicates is: 202 206 208 260 262 268 280 282 286 402 406 408 420 426 428 460 462 468
# 480 482 486 602 606 608 620 626 628 680 682 686 802 806 808 820 826 828 860 862 868.
#
# Your task is to write a program that generates phone numbers according to the rules given above.
# When you are finished, you are welcome to read or run a suggested solution, or to post your own
# solution or discuss the exercise in the comments below.

def generate(n=3, black_list=[])
  (0..9).to_a.
    repeated_permutation(n).
    select { |xs| valid?(xs, black_list) }.
    map(&:join).
    map(&:to_i)
end

def valid?(xs, black_list)
  xs.first != 0 &&
 !xs[1..-1].include?(4) &&
  xs[0..-2].zip(xs[1..-1]).map { |a,b| a != b }.all? &&
  xs - black_list == xs
end

def test(output, target)
  puts "target: #{target}"
  puts
  puts "output: #{output}"
  puts
  puts "pass: #{output == target}"
  puts
end

target = [
  202, 206, 208, 260, 262, 268, 280, 282, 286, 402, 406, 408, 420,
  426, 428, 460, 462, 468, 480, 482, 486, 602, 606, 608, 620, 626,
  628, 680, 682, 686, 802, 806, 808, 820, 826, 828, 860, 862, 868
]

result = generate(3,  [1, 3, 5, 7, 9])

test result, target

__END__

Solution in Ruby. Generates all numbers of n length first then select the ones that match the rules.

[sourcecode lang="ruby"]

def generate(n=3, black_list=[])
  (0..9).to_a.
    repeated_permutation(n).
    select { |xs| valid?(xs, black_list) }.
    map(&:join).
    map(&:to_i)
end

def valid?(xs, black_list)
  xs.first != 0 &&
 !xs[1..-1].include?(4) &&
  xs[0..-2].zip(xs[1..-1]).map { |a,b| a != b }.all? &&
  xs - black_list == xs
end

generate(3,  [1, 3, 5, 7, 9])

[/sourcecode]

outputs:

[sourcecode lang="ruby"]

[202, 206, 208, 260, 262, 268, 280, 282, 286, 402, 406, 408, 420, 426, 428, 460, 462, 468, 480,
482, 486, 602, 606, 608, 620, 626, 628, 680, 682, 686, 802, 806, 808, 820, 826, 828, 860, 862, 868]

[/sourcecode]
