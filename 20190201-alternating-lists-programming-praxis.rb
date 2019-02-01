# source: https://programmingpraxis.com/2019/02/01/alternating-lists
#
# Alternating Lists by Programing Praxis
#
# Today’s exercise is a simple task in list manipulation:
#
# Write a program that takes one or more lists and returns a single list
# containing the elements of the input lists, taken alternately from the lists.
# If the lists are of different lengths, continue taking items from the lists
# that remain.
#
# For instance, given the inputs (1 2 3 4 5), (a b c) and (w x y z), the desired
# output is (1 a w 2 b x 3 c y 4 z 5).
#
# Your task is to write a program to take items alternately from multiple lists.
# When you are finished, you are welcome to read or run a suggested solution, or
# to post your own solution or discuss the exercise in the comments below.


# Assume lists have no nils
def alternate(*lists)
  head, *tail = lists
  head.zip(*tail).flatten.compact
end

# List can have nils
def alternate2(*lists)
  lists.map(&:size).max.times.reduce([]) do |m, i|
    m.concat(lists.select { |l| i < l.size }.map {|l| l[i] })
  end
end

# Just using loops
def alternate3(*lists)
  max_size = 0

  lists.each do |l|
    if l.size > max_size
      max_size = l.size
    end
  end

  out = []
  (0...max_size).each do |i|
    lists.each do |l|
      if i < l.size
        out << l[i]
      end
    end
  end
  out
end

# Recursive
def alternate4(lists, out=[])
  if lists.empty?
    return out 
  end
  l = lists.select(&:any?)
  alternate4(
    l.map { |l| l.slice(1..-1) },
    out.concat(l.map(&:first)))
end


puts alternate([1,2,3,4,5], ["a","b","c"], ["w","x","y","z"]).inspect
puts alternate2([1,2,3,4,5], ["a","b","c"], ["w","x","y","z"]).inspect
puts alternate3([1,2,3,4,5], ["a","b","c"], ["w","x","y","z"]).inspect
puts alternate4([[1,2,3,4,5], ["a","b","c"], ["w","x","y","z"]]).inspect

# outputs
# [1, "a", "w", 2, "b", "x", 3, "c", "y", 4, "z", 5]

