# source: https://programmingpraxis.com/2018/06/08/overlap/

# Overlap by programmingpraxis
#
# We have today a simple exercise to spice up your Friday lunch hour:
#
# A range of integers is specified by its endpoints; for instance, the range
# [19, 25] includes the values 19, 20, 21, 22, 23, 24, and 25. The overlap of
# two ranges is those values that appear in both; for instance, given the ranges
# [19, 25] and [22, 30], the overlap is the range [22, 25]. The ranges [19, 25]
# and [12, 17] have no overlap.
#
# Your task is to write a program that takes the endpoints of two ranges and
# returns their overlap, or reports that they have no overlap. When you are
# finished, you are welcome to read or run a suggested solution, or to post your
# own solution or discuss the exercise in the comments below.

def overlap(a, b)
  o = a.to_a & b.to_a
  o.size < 2 ? nil : (o.first..o.last)
end

puts overlap((19..25), (22..30))
puts overlap((19..25), (12..17)).inspect
