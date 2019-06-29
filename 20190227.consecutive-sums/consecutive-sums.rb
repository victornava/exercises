# Consecutive Sums by Programming Praxis
#
# Given the positive integer 15, there are three ways to take consecutive
# positive integers that sum to 15: 1+2+3+4+5, 4+5+6 and 7+8.
#
# Your task is to write a program that, given a positive integer, finds all the
# ways that consecutive positive integers can sum to the target integer. When
# you are finished, you are welcome to read or run a suggested solution, or to
# post your own solution or discuss the exercise in the comments below.
#
# source: http://programmingpraxis.com/2019/02/12/consecutive-sums/

def consecutive_sums(number)
  out = []
  (1...number).each do |i|
    sum = i
    ((i+1)...number).each do |j|
      sum += j
      if sum == number
        out << (i..j).to_a
        break
      end
      if sum > number
        break
      end
    end
  end
  out
end


def test(method, input, target)
  output = send(method, input)
  puts "input: #{input.inspect}"
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target ? '✅' : '❌'}"
end

test :consecutive_sums, 15, [[1,2,3,4,5], [4,5,6], [7,8]]
