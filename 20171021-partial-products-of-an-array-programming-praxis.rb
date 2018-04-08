# source: https://programmingpraxis.com/2017/10/20/partial-products-of-an-array
#
# Partial Products Of An Array
#
# Replace each element of an array with the product of every other element of the
# array, without using the division operator. For instance,
#
# given array (5 3 4 26 8)
# the desired output is (1152 1920 1440 2880 960 720)
#
# Your task is to write a program to replace each element of an array with the
# product of every other element of the array, without performing division. When
# you are finished, you are welcome to read or run a suggested solution, or to
# post your own solution or discuss the exercise in the comments below.

def partial_product(array)
  array.each_with_index.map do |_, i|
    array.rotate(i).drop(1).reduce(&:*)
  end
end

input  = [5, 3, 4, 2, 6, 8]
target = [1152, 1920, 1440, 2880, 960, 720]
output = partial_product(input)

puts "input: #{input}"
puts "target: #{target}"
puts "output: #{output}"
puts "pass: #{target == output }"

__END__

In Ruby.

[sourcecode lang="ruby"]
  def partial_product(array)
    array.each_with_index.map do |_, i|
      array.rotate(i).drop(1).reduce(&:*)
    end
  end
[/sourcecode]