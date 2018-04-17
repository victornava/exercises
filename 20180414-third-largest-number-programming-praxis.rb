# source: https://programmingpraxis.com/2018/04/13/third-biggest-number
# Write a program to read ten numbers input by the user and write the third
# largest of those ten numbers.

# Assumes clean input of positive integers. Just for fun.
puts 10.times.map { print "Enter a number: "; Integer(gets) }.uniq.sort[-3] || 'Nop'
