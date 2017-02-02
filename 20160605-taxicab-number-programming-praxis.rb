# https://programmingpraxis.com/2012/11/09/taxicab-numbers/

# Taxicab Numbers
#
# We haven’t done a coding interview question for a while. Here’s one that is
# supposedly asked at Google:
#
# The mathematician G. H. Hardy was on his way to visit his collaborator
# Srinivasa Ramanujan who was in the hospital. Hardy remarked to Ramanujan that
# he traveled in a taxi cab with license plate 1729, which seemed a dull number.
# To this, Ramanujan replied that 1729 was a very interesting number — it was the
# smallest number expressible as the sum of cubes of two numbers in two different
# ways. Indeed, 103 + 93 = 123 + 13 = 1729.
#
# Given an arbitrary positive integer, how would you determine if it can be
# expressed as a sum of two cubes?
#
# Your task is to write a function that returns all the ways a number can be
# written as the sum of two non-negative cubes; use it to verify the truth of
# Ramanujan’s statement. When you are finished, you are welcome to read or run a
# suggested solution, or to post your own solution or discuss the exercise in the
# comments below.

def taxicab_numbers(n)
  (1..Math.cbrt(n))
  .to_a
  .combination(2)
  .select { |a, b| ((a ** 3) + (b ** 3)) == n }
end

puts taxicab_numbers(1729).inspect