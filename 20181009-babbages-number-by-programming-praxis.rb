# source: https://programmingpraxis.com/2018/10/09/babbages-number/
#
# Babbage's Number by programmingpraxis
# =====================================
#
# Charles Babbage, whose Analytical Engine was a direct predecessor of today's
# digital computer, gave this example of a problem that his Analytical Engine
# could solve in an 1837 letter to Lord Bowden:
#
# > What is the smallest positive integer whose square ends in the digits 269,696?
#
# Babbage knew that 99,736 has a square with the required ending, but didn't know
# if there was a smaller number.
#
# Your task is to find Babbages's number.

p (1..Float::INFINITY).find { |i| (i * i).to_s =~ /269696$/ }





