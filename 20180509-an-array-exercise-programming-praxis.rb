# Source: http://programmingpraxis.com/2018/05/08/an-array-exercise/
#
# An Array Exercise
#
# Given an array of distinct integers, replace each element of the array with
# its corresponding rank in the array. For instance, the input array
# [10,8,15,12,6,20,1] is replaced by the output array [4,3,6,5,2,7,1] because
# element 1 has rank 1, element 6 has rank 2, element 8 has rank 3, element 10
# has rank 4, element 12 has rank 5, element 15 has rank 6, and element 20 has
# rank 7.

# Quick and dirty
xs = [10,8,15,12,6,20,1]
xs.map { |x| 1 + xs.sort.find_index(x) }

# Outputs
[4, 3, 6, 5, 2, 7, 1]
