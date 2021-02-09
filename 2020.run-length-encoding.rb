# https://programmingpraxis.com/2021/02/09/run-length-encoding-2/2/
#
# Most candidates cannot solve this interview problem:
#
# Input: “aaaabbbcca”
#
# Output: [(“a”,4), (“b”,3), (“c”,2), (“a”,1)]
#
# Write a function that converts the input to the output. I ask it in the
# screening inverview and give it 25 minutes. How would you solve it?

def encode(input)
  char = nil
  count = 0
  out = ""
  bag =  []
  input.chars.each do |c|
    case char
    when nil
      char = c
      count = 1
    when c
      count += 1
    else
      bag << [char, count]
      char = c
      count = 1
    end
  end
  
  if char
    bag << [char, count]
  end
  
  out << "["
  out << bag.map {|a, b| "(\"#{a}\",#{b})"}.join(", ")
  out << "]"
  out
end

puts encode("aaaabbbcca") == '[("a",4), ("b",3), ("c",2), ("a",1)]'
