# source: https://programmingpraxis.com/2018/09/18/1-800-ppraxis/
#
# 1-800-PPRAXIS by Programming Praxis
#
# I hate businesses with telephone numbers that spell words; it’s awkward to
# type letters at a telephone, and often the words are abbreviated or spelled
# wrong so they are no longer mnemonic, which defeats the purpose. So this
# morning when I had to call one of those businesses, I wrote a program to
# translate letters to numbers after I had been waiting on hold long enough to
# get really annoyed.
#
# Your task is to write a program to translate telephone numbers specified as
# words. When you are finished, you are welcome to read or run a suggested
# solution, or to post your own solution or discuss the exercise in the comments
# below.

# Simple obvious solution: direct key/value mapping using a hash.
def translate(text)
  text.chars.map do |c|
    { 
      a: 2, b: 2, c: 2,
      d: 3, e: 3, f: 3,
      g: 4, h: 4, i: 4,
      j: 5, k: 5, l: 5,
      m: 6, n: 6, o: 6,
      p: 7, q: 7, r: 7, s: 7,
      t: 8, u: 8, v: 8,
      w: 9, x: 9, y: 9, z: 9
    }[c.downcase.to_sym] or c
  end.join
end

# Still mapping key to values using a hash.
# This time the keys contains all letters of a number.
def translate(text)
  text.chars.map do |c|
    match = {
      "abc"  => 2,
      "def"  => 3,
      "ghi"  => 4,
      "jkl"  => 5,
      "mno"  => 6,
      "pqrs" => 7,
      "tuv"  => 8,
      "wxyz" => 9
    }.detect { |k,v| k.include?(c.downcase) }
    
    match ? match.last : c
  end.join
end

# And this one does the mapping with an array infering the value from the index.
def translate(text)
  mapping = ["abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
  text.chars.map do |c|
    match = mapping.find_index { |s| s.include?(c.downcase) }
    match ? (match + 2) : c
  end.join
end


def test_translate(input, target)
  output = translate(input)
  puts
  puts "input: #{input}"
  puts "output: #{output}"
  puts "pass: #{output == target ? '✅' : '❌'}"
end

test_translate "1-800-PPRAXIS", "1-800-7772947"
test_translate "+1-514-AUTOBUS", "+1-514-2886287"
test_translate "13TAXI", "138294"
test_translate "1800-THRIFTY", "1800-8474389"
test_translate "1-US-RENT-A-WRECK", "1-87-7368-2-97325"
