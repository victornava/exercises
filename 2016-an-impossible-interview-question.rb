# https://programmingpraxis.com/2016/10/18/an-impossible-interview-question/
#
# You are to write a program that reads a stream of characters from the input and
# returns a random character from the stream. Any character should have an equal
# probability of being returned. You may only use a single character of storage
# space; in particular, you may not save multiple characters from the input
# stream.

def pick_random(stream)
  stream.chars.uniq.sample
end

input = "an impossible interview question"

# test
puts 1_000_000.times
  .map { pick_random(input) }
  .group_by(&:itself)
  .sort_by {|k, v| k }
  .map {|k, v| "#{k}: #{v.count}" }
 
__END__

The tricky part of this one is the condition:

> Only 1 character of storage space; in particular, you may not save multiple characters from the input stream

What is storage? variables? ram? disk?

Anyway here is my solution which might not comply with the storage condition.

[sourcecode lang="ruby"]

def pick_random(stream)
  stream.chars.uniq.sample
end

# test

input = "an impossible interview question"

puts 1_000_000.times
  .map { pick_random(input) }
  .group_by(&:itself)
  .sort_by {|k, v| k }
  .map {|k, v| "#{k}: #{v.count}" }

[/sourcecode]

Output (How many times each letter was picked?)

 : 58765
a: 58743
b: 58609
e: 58692
i: 58765
l: 58512
m: 58883
n: 58760
o: 58570
p: 59486
q: 58672
r: 59039
s: 58658
t: 58681
u: 59169
v: 58940
w: 59056