# Maximum Product
# from: https://programmingpraxis.com/2019/06/11/maximum-product/2/
#
# Given three arrays of integers, both positive and negative, find the maximum
# product that can be formed by taking one element from each array. For
# instance, if A = [10,-10,15,-2], B = [10,-12,13,-2], and C = [-11,-10,9,-12],
# the maximum product is 2160 using 15, -12 and -12.
#
# Your task is to write a program that finds the maximum product of three
# integers, taking one each from three arrays. When you are finished, you are
# welcome to read or run a suggested solution, or to post your own solution or
# discuss the exercise in the comments below.

def max_prod(arrays)
  head, *tail = arrays.map(&:minmax)
  head.product(*tail)
    .map { |xs| [xs.reduce(:*), xs] }
    .max_by(&:first)
end

# test
puts max_prod([[10,-10,15,-2], [10,-12,13,-2], [-11,-10,9,-12]]) == [2160, [15, -12, -12]]