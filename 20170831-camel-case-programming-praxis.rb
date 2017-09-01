# Source: https://programmingpraxis.com/2017/08/29/camel-case/
#
# Camel Case
#
# Some programmers write variable names in camelCase, each word starting with a capital letter, while
# other programmers separate words with underscores like_this.
#
# Your task is to write programs that convert between the two forms. When you are finished, you are
# welcome to read or run a suggested solution, or to post your own solution or discuss the exercise
# in the comments below.
#
# camelCase -> camel_case
# like_this -> likeThis

def camel_to_snake(camel_string)
  camel_string.gsub(/[[:lower:]][[:upper:]]/) { |x| x.chars.join('_').downcase }
end

def snake_to_camel(snake_string)
  snake_string.gsub(/\_[[:lower:]]/) { |x| x.chars.last.upcase }
end

def test(fn, input, target)
  output = self.send(fn, input)
  puts "%-17s → %-17s %-17s %s" % [input, output, target, (target == output ? '✅' : '❌')]
end

puts "Snake to Camel case"
test :camel_to_snake, 'one',             'one'
test :camel_to_snake, 'camelCase',       'camel_case'
test :camel_to_snake, 'likeThis',        'like_this'
test :camel_to_snake, 'doTheEvolution',  'do_the_evolution'
test :camel_to_snake, 'tomaÁgua',        'toma_água'
test :camel_to_snake, 'cantóAyer?',      'cantó_ayer?'

puts
puts "Camel to Snake case"
test :snake_to_camel, 'one',              'one'
test :snake_to_camel, 'camel_case',       'camelCase'
test :snake_to_camel, 'like_this',        'likeThis'
test :snake_to_camel, 'do_the_evolution', 'doTheEvolution'
test :snake_to_camel, 'toma_água',        'tomaÁgua'
test :snake_to_camel, 'cantó_ayer?',      'cantóAyer?'

__END__

Solution for ASCII characters in Ruby.

[sourcecode lang="ruby"]

def camel_to_snake(camel_string)
  camel_string.gsub(/[[:lower:]][[:upper:]]/) { |x| x.chars.join('_').downcase }
end

def snake_to_camel(snake_string)
  snake_string.gsub(/\_[[:lower:]]/) { |x| x.chars.last.upcase }
end

[/sourcecode]

Test:

[sourcecode lang="ruby"]

def test(fn, input, target)
  output = self.send(fn, input)
  puts "%-17s → %-17s %-17s %s" % [input, output, target, (target == output ? 'OK' : 'FAIL')]
end

puts "Snake to Camel case"
test :camel_to_snake, 'one',             'one'
test :camel_to_snake, 'camelCase',       'camel_case'
test :camel_to_snake, 'likeThis',        'like_this'
test :camel_to_snake, 'doTheEvolution',  'do_the_evolution'
test :camel_to_snake, 'tomaÁgua',        'toma_água'
test :camel_to_snake, 'cantóAyer?',      'cantó_ayer?'

puts
puts "Camel to Snake case"
test :snake_to_camel, 'one',              'one'
test :snake_to_camel, 'camel_case',       'camelCase'
test :snake_to_camel, 'like_this',        'likeThis'
test :snake_to_camel, 'do_the_evolution', 'doTheEvolution'
test :snake_to_camel, 'toma_água',        'tomaÁgua'
test :snake_to_camel, 'cantó_ayer?',      'cantóAyer?'

[/sourcecode]

Outputs

[sourcecode]

[/sourcecode]

Snake to Camel case
one               → one               one               OK
camelCase         → camel_case        camel_case        OK
likeThis          → like_this         like_this         OK
doTheEvolution    → do_the_evolution  do_the_evolution  OK
tomaÁgua          → toma_água         toma_água         OK
cantóAyer?        → cantó_ayer?       cantó_ayer?       OK

Camel to Snake case
one               → one               one               OK
camel_case        → camelCase         camelCase         OK
like_this         → likeThis          likeThis          OK
do_the_evolution  → doTheEvolution    doTheEvolution    OK
toma_água         → tomaÁgua          tomaÁgua          OK
cantó_ayer?       → cantóAyer?        cantóAyer?        OK

[/sourcecode]
