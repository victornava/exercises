=begin

# Password generator by V

Goal: Make a tool that generates secure passwords.

The most important property of our tool is security. We can define security by
the randomness/uniqueness of the string generated by the tool.

Some of the properties we care about we can specify as options like:

    Size: number of char in password (default: 8)
    Numbers: includes numbers
    Lowercase: includes lowercase letters
    Uppercase: includes lowercase letters
    Special: standard non-alpha chars ~!@#$%^&*()_+`-=[]\{}|;':",./<>?

So the tool would accept all of this properties as options/arguments.

For simplicity we can assume that letters are characters in the english
alphabet.

## Measuring Uniqueness

### Likelihood of a passwords repeat is low

We can test this by generating a million passwords on length 6 (to pick a
number) and testing the all passwords generated are unique.

### Character types are distributed evenly

Password with numbers and letters of size 8 should have 4 letters and 4 chars.
in this case letters are a character type and numbers another character type.

We can define our character types as follows (same as options)

    l → lower case letters
    u → upper case letters
    n → numbers
    s → special characters

### High variation of char type sequence

Generating 4 passwords with numbers and letters could return a some of these
patterns:

    llllnnnn → 1234abcd
    llnnllnn → 12ab34cd
    lnlnlnln → 1a2b3c4d
    nlnlnlnl → a2b3c4d1

As opposed to the same pattern all the time:

    lnlnlnln
    lnlnlnln
    lnlnlnln
    lnlnlnln

### Low repetition of characters

    aaaa1234 → bad (a repeats 4 times)
    4o87basd → good

=end

CHAR_TYPES = {
  numbers: '0123456789'.chars,
  lower:   'abcdefghijklmnopqrstuvwxyz'.chars,
  upper:   'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.chars,
  special: '~!@#$%^&*()_+`-=[]\{}|;:",./<>?'.chars,
}

def generate(size: 8, numbers: true, lower: true, upper: false, special: false)
  bag = []
  bag += CHAR_TYPES[:numbers] if numbers
  bag += CHAR_TYPES[:lower]   if lower
  bag += CHAR_TYPES[:upper]   if upper
  bag += CHAR_TYPES[:special] if special
  size.times.map { bag.sample }.join
end

# Test
def test_uniqueness(repeat:100, peek_at:10, &block)
  r = repeat.times.map { yield }

  if r.uniq.size == repeat
    puts "✅"
    return
  end

  puts "❌"
  puts "At least these things are not uniq"
  puts r.group_by(&:itself)
        .first(peek_at)
        .map {|k, v| "  '#{k}' repeats #{v.size} times" }
end

tests = [
  "5.times.map { generate }",
  "5.times.map { generate(size: 10) }",
  "5.times.map { generate(size: 20) }",
  "5.times.map { generate(size: 40) }",
  "5.times.map { generate(upper: true)}",
  "5.times.map { generate(special: true)}",
  "5.times.map { generate(upper: true, special: true)}",
  "test_uniqueness(repeat:1000000) { generate(upper: true, special:true) }"
]

# Don't try this at home!
tests.each do |t|
  puts t
  puts eval(t)
  puts
end

# Output

# 9flcxg6w
# 8x6h9b1j
# lh1svemj
# ed9e1iyt
# v2n5h3nl
#
# 5.times.map { generate(size: 10) }
# mkw0zuqjrh
# 0u2sog9js3
# 42j39q70sr
# tn3gnh2mxu
# psgqpp4dyr
#
# 5.times.map { generate(size: 20) }
# 3dlfdsf5qhl2kevlnwa8
# kmpn82pon0cbktkbug78
# d5p5ltusoatswudgb57j
# h4am5q8gb0yase5ikauq
# m54m79koczx8ztjrzvj4
#
# 5.times.map { generate(size: 40) }
# ja00pvac8dpj8bbf84o9o12oeih0j7ggt2xks29k
# k95jyohmqgnh8zv2ky1qumr6n9n2mg96s4r0folh
# wmbnzd7vehd0rc69q55d4jd1a7dswms52d6px8m7
# 1zgwyyvqkd3xx9cfhlqt5ja7vzm3ad64umwbue8f
# 8lh06etxt4lyzw94q6k64o69krjwr36xfzd1oypr
#
# 5.times.map { generate(upper: true)}
# LpA6RILh
# IGbHGCnY
# E7GziC4X
# ppYQdkk4
# dMproIG6
#
# 5.times.map { generate(special: true)}
# [/n:;7%[
# p50@|\`)
# 3t"7>,d#
# fm6j]m63
# it=t%h^j
#
# 5.times.map { generate(upper: true, special: true)}
# T_pyxbS5
# 6O=!{_e=
# ]YQcKI1g
# !]HBP{~2
# H]UX&1]>
#
# test_uniqueness(repeat:1000000) { generate(upper: true, special:true) }
# ✅

=begin
# Looking back

Whilst doing this I realised that some of the attributes in the spec would
maybe make the passwords more predictable, like "Character types are
distributed evenly".

I'm thinking if the distrubution of char type is even then it would be easier
to crack because the pattern is more regular? I dunno.

I'm also being lazy, this is more difficult to test than I thought.
=end