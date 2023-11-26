# https://programmingpraxis.com/2016/11/18/rip-leibniz/
#
# RIP Leibniz November 18, 2016 Gottfried Wilhelm Leibnez was a German
# mathematician and philosopher, and a developer, independently of Isaac Newton,
# of calculus; it was he who invented the d/dx notation used in writing
# integrals. He died three hundred years ago, on November 14, 1716, so today (a
# few days late, sorry) we have an exercise about calculus:
#
# Write a program that computes the average number of comparisons required to
# determine if a random sequence is sorted. For instance, in the sequence 1 2 3 5
# 4 6, the first inversion appears between 5 and 4, so it takes four comparisons
# (1<2, 2<3, 3<5, 5<4) to determine that the sequence is not sorted.

def comparisons_until_unsorted(list, steps=0)
  head, *tail = list
  if tail.empty?
    steps
  elsif head > tail.first
    steps + 1
  else
    comparisons_until_unsorted(tail, steps + 1)
  end
end

def average_comparisons_to_sort(length, passes=1000000)
  list = (1..length).to_a
  passes.
    times.
    map { comparisons_until_unsorted(list.shuffle) }.
    reduce(0.0, &:+) / passes
end

def test(output, target)
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target}"
  puts
end

test comparisons_until_unsorted([]), 0
test comparisons_until_unsorted([1]), 0
test comparisons_until_unsorted([1,2,3,4]), 3
test comparisons_until_unsorted([1,2,4,3]), 2
test comparisons_until_unsorted([3, 5, 7, 9, 2]), 4

(1..20).each do |n| 
  puts "#{n}: #{average_comparisons_to_sort(n)}"
end

__END__

Submission

[sourcecode lang="ruby"]

def comparisons_until_unsorted(list, steps=0)
  head, *tail = list
  if tail.empty?
    steps
  elsif head > tail.first
    steps + 1
  else
    comparisons_until_unsorted(tail, steps + 1)
  end
end

def average_comparisons_to_sort(length, passes=1000000)
  list = (1..length).to_a
  passes.
    times.
    map { comparisons_until_unsorted(list.shuffle) }.
    reduce(0.0, &:+) / passes
end

(4..20).each do |n| 
  puts "#{n}: #{average_comparisons_to_sort(n)}"
end

[/sourcecode]

Outputs:

4: 1.666927
5: 1.706343
6: 1.714978
7: 1.719484
8: 1.717933
9: 1.715861
10: 1.717179
11: 1.718295
12: 1.717068
13: 1.718003
14: 1.718197
15: 1.718366
16: 1.718356
17: 1.717484
18: 1.719986
19: 1.718612
20: 1.718551


