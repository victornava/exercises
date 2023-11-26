# 2020-07-01
#
# Shuffle An Array
#
# Given an array consisting of 2n elements in the form
# [x1,x2,…,xn,y1,y2,…,yn], return the array in the form
# [x1,y1,x2,y2,…,xn,yn].
#
# The Reddit poster claims to be new to Scheme and functional programming, and
# was thinking of a solution using length and list-ref, but couldn’t solve the
# problem.
#
# Your task is to show the student how to solve the problem. When you are
# finished, you are welcome to read or run a suggested solution, or to post your
# own solution or discuss the exercise in the comments below.
#
# Source: https://programmingpraxis.com/2020/06/30/shuffle-an-array/

a = [1, 2, 3, 'a', 'b', 'c']
puts a[0..((a.size/2)-1)].zip(a[(a.size/2)..(a.size-1)]).inspect
