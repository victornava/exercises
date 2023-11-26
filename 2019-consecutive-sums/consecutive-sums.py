# Consecutive Sums by Programming Praxis
#
# Given the positive integer 15, there are three ways to take consecutive
# positive integers that sum to 15: 1+2+3+4+5, 4+5+6 and 7+8.
#
# Your task is to write a program that, given a positive integer, finds all the
# ways that consecutive positive integers can sum to the target integer. When
# you are finished, you are welcome to read or run a suggested solution, or to
# post your own solution or discuss the exercise in the comments below.

# source: http://programmingpraxis.com/2019/02/12/consecutive-sums/

def consecutive_sums(number):
  out = []
  for i in xrange(1, number):
    sum = i
    for j in xrange((i+1), number):
      sum += j
      if sum == number:
        out.append(range(i, j+1))
        break
      if sum > number:
        break
  return out

print(consecutive_sums(15))