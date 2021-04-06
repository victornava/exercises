# source: https://programmingpraxis.com/2018/04/20/recognizing-fibonacci-numbers
#
# Write a program that determines if an input number n is a Fibonacci number.

def fib?(n)
  return false if n < 0
  return true if n == 0

  prev = 0
  curr = 1

  loop do
    temp = prev + curr
    prev = curr
    curr = temp
    return true if curr == n
    return false if curr > n
  end
end

# Test
(0..21).each do |n|
  r = fib?(n) ? "✅" : "❌"
  puts "#{n} #{r}"
end