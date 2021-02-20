=begin

Animals who Ate

form: https://programmingpraxis.com/2021/01/12/animal-txt/

Today's task is from a beginning programmer, who starts with an input file
called animal.txt:

There once was a Dog

Wednesday he ate Apples
Thursday he ate Apples
Friday he ate Apples
Saturday he ate carrots

There once was a Bear

Tuesday he ate carrots
Wednesday he ate carrots
Thursday he ate chicken

He wants to create this output:

Food: Apples Animals who ate it: 1
=======
Dog

Food: Carrots Animals who ate it: 2
========
Bear
Dog

Food: Chicken Animals who ate it: 1
========
Bear

He gave a complicated awk solution that didn't work; it produced duplicate
lines of output in those cases where the same animal ate the same food on
multiple days.

Your task is to write a program to produces the desired transformation form
input to output.

=end
require 'yaml'
require 'test/unit'

def aha1(str)
  str = str.clone
  animal_rg = /\AThere once was a (\w+)/
  food_rg = /\A\w+ he ate (\w+)/
  h = {} # { food: [animal...] }

  str.strip!
  while str =~ animal_rg
    animal = Regexp.last_match[1]
    str.sub!(animal_rg,'')
    str.strip!

    while str =~ food_rg
      food = Regexp.last_match[1]
      str.sub!(food_rg,'')
      str.strip!
      if h[food]
        h[food] |= [animal]
      else
        h[food] = [animal]
      end
    end
  end
  
  render(h)
end

def aha2(str)
  h = {} # { food: [animal...] }
  s = str.clone.strip

  while m = s.match(/\AThere once was a (\w+)/)
    animal = m[1]
    s = s[m.end(1)..].strip

    while m = s.match(/\A\w+ he ate (\w+)/)
      food = m[1]
      s = s[m.end(1)..].strip
      if h[food]
        h[food] |= [animal]
      else
        h[food] = [animal]
      end
    end
  end

  render(h)
end

def aha3(str)
  yml = str
    .gsub(/^There once was a (\w+)/) { $1 + ":" }
    .gsub(/^\w+ he ate (\w+)/) { "- " + $1 }

  animals_foods = YAML.load(yml)
  
  foods_animals = animals_foods.reduce({}) do |memo, pair|
    animal, foods = pair
    foods.uniq.each do |food|
      if memo[food]
        memo[food] << animal
      else
        memo[food] = [animal]
      end
    end
    memo
  end
  
  render(foods_animals)
end

def render(hash)
  hash.reduce("") do |out, pair|
    food, animals = pair
    out << "Food: #{food} Animals who ate it: #{animals.size}\n"
    out << "========\n"
    out << animals.sort.join("\n")
    out << "\n\n"
  end
end

class SubjectTest < Test::Unit::TestCase
  def test_the_thing
    subject = <<~TXT
There once was a Dog

Wednesday he ate Apples
Thursday he ate Apples
Friday he ate Apples
Saturday he ate Carrots

There once was a Bear

Tuesday he ate Carrots
Wednesday he ate Carrots
Thursday he ate Chicken
TXT

    target = <<~TXT
Food: Apples Animals who ate it: 1
========
Dog

Food: Carrots Animals who ate it: 2
========
Bear
Dog

Food: Chicken Animals who ate it: 1
========
Bear

TXT

    assert_equal target, aha1(subject)
    assert_equal target, aha2(subject)
    assert_equal target, aha3(subject)
  end
end
