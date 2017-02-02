# https://programmingpraxis.com/2016/12/02/
# 
# Beale’s Cipher
#
# In the early 1800, Thomas J. Beale mined a large quantity of gold and silver,
# secretly, some place in the American West, and brought the gold, silver, and
# some jewels purchased with the treasure to Virginia, where he buried it. He
# wrote three coded documents that described the location of the buried treasure,
# the nature of the treasure, and the names of the owners. He never came back to
# retrieve the treasure. Only the second of those documents has been decoded, and
# many people, even today, are scouring Bedford County, Virginia, looking for
# buried treasure. Or so the story goes.
#
# Beale used a variant of a book cipher. He chose a long text as a key, numbered
# each of the words in the text sequentially, starting from 1, and formed a
# message by choosing from the key text a word for each character of plain text
# having the same initial letter as the plain text; the cipher text consists of a
# list of the sequence numbers of the chosen words. For instance, if the key text
# is “now is the time” and the plain text is “tin”, then either (3 2 1) or (4 2
# 1) are valid encipherments. If the key text is long, there will be many
# duplicates, as we saw with the letter “t”, and the resulting cipher will be
# reasonably secure. Beale used the 1322 words of the Declaration of Independence
# as the key text for the second document; the key texts associated with the
# first and third documents are unknown.
#
# Your task is to write programs that encipher and decipher messages using the
# Beale cipher; use it to decode the second document.

def test(output, target)
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target}"
  puts
end

def encipher(key, text)
  words = key.scan(/\w+/)
  text.scan(/\w+/).flat_map do |word|
    word.chars.map do |char, i|
      words
        .each_with_index
        .select { |word, _| word.chars.first == char }
        .sample
        .last + 1
    end
  end
end

def decipher(key, cipher)
  char_map = Hash[
    key
      .scan(/\w+/)
      .each_with_index
      .map { |w, i| [i + 1, w[0]] }
  ]

  cipher.map { |char| char_map[char] }.join
end
  
test encipher("now is the time" , "tin"), [3,2,1]
test encipher("now is the time" , "tin tin"), [3, 2, 1, 4, 2, 1]
test decipher("now is the time",  [3,2,1]), "tin"

key = "lorem ipsum dolor sit amet, consectetur adipisicing elit"
test decipher(key, encipher(key, "lisa is ace")), "lisaisace"

__END__

Sumbission

In Ruby

[sourcecode lang="ruby"]
  
def encipher(key, text)
  words = key.scan(/\w+/)
  text.scan(/\w+/).flat_map do |word|
    word.chars.map do |char, i|
      words
        .each_with_index
        .select { |word, _| word.chars.first == char }
        .sample
        .last + 1
    end
  end
end

def decipher(key, cipher)
  char_map = Hash[
    key
      .scan(/\w+/)
      .each_with_index
      .map { |w, i| [i + 1, w[0]] }
  ]

  cipher.map { |char| char_map[char] }.join
end

encipher("now is the time" , "tin")
 => [4, 2, 1]

decipher("now is the time",  [4, 2, 1])
  => "Tin"

key = "lorem ipsum dolor sit amet, consectetur adipisicing elit"
decipher(key, encipher(key, "lisa is ace"))
  => "lisaisace"

[/sourcecode]
