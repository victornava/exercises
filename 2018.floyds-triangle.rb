# source:
# https://programmingpraxis.com/2018/05/22/floyds-triangle/#comment-70789
#
# Floyd’s Triangle
#
# Floyd’s Triangle lists the numbers in order, in lines of increasing length,
# so a Floyd’s Triangle of size 5 looks like this:
#
# 1
# 2 3
# 4 5 6
# 7 8 9 10
# 11 12 13 14 15
#
# Your task is to write two programs that print Floyd’s Triangle; you must
# write two different programs that use two fundamentally different methods.
# When you are finished, you are welcome to read or run a suggested solution, or
# to post your own solution or discuss the exercise in the comments below.


# Funtional. Iterative.
# First we generate the values range for each row
# Then converte them into strings
def floyd_triangle1(n)
  return ''    if n < 1
  return "1\n" if n == 1
  (2..n)
    .reduce([[1]]) { |m, i| m << ((m.last.last + 1)..(m.last.last + i)) }
    .map { |x| x.to_a.join(" ") + "\n" }.join
end

# Imperative. Using "for" loops
# Doing the whole thing in one go
def floyd_triangle2(n)
  return "" if n <= 0
  
  out = ""
  last = 0

  (1..n).each do |i|
    (1..i).each do |j|
      last += 1
      out << last.to_s
      out << " " if i > j
    end
    out << "\n"
  end
  out
end

# Functional. Using the triagular number formula.
# An advantage of this is that we can calculate the values of a row
# independently. So in theory we could calculate each row in parallel
def floyd_triangle3(n)
  return "" if n <= 0
  
  # Triangular Number. See: https://en.wikipedia.org/wiki/Triangular_number
  tn = -> (n) { (n * (n + 1) ) / 2 }
  
  (1..n)
    .map { |n| n == 1 ? (1..1) : (tn.(n) - (n-1))..tn.(n) }
    .reduce('') { |m, x| m + x.to_a.join(" ") + "\n" }
end

# Test
def test(target, output, input)
  puts "#{output == target ? '✅' : '❌'} n: #{input.inspect} "
  if target != output
    puts "target: "
    puts target
    puts "output:"
    puts output
  end
end

examples = <<-EXAMPLES
1
---
1
2 3
---
1
2 3
4 5 6
---
1
2 3
4 5 6
7 8 9 10
---
1
2 3
4 5 6
7 8 9 10
11 12 13 14 15
---
1
2 3
4 5 6
7 8 9 10
11 12 13 14 15
16 17 18 19 20 21
---
1
2 3
4 5 6
7 8 9 10
11 12 13 14 15
16 17 18 19 20 21
22 23 24 25 26 27 28
EXAMPLES

puts "floyd_triangle"
examples.split("---\n").each_with_index.each do |target, n|
  n += 1
  test target, floyd_triangle1(n), n
  test target, floyd_triangle2(n), n
  test target, floyd_triangle3(n), n
end

puts floyd_triangle3(10)
