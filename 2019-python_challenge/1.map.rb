# Python Challenge #1
# From: http://www.pythonchallenge.com/pc/def/map.html

# text = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."
#
def t1(text)
  text.chars.map {|c| c =~ /[a-x]/ ? (c.ord + 2).chr : c == 'y' ? 'a': c == 'z' ? 'b' : c }.join
end
#
# def t2(text)
#   text.chars.map {|c| o=c.ord; (o < 97 || o > 121) ? c : o >= 97 && o <= 120 ? (o + 2).chr : (o - 24).chr }.join
# end
#
# def t3(text)
#   text.chars.map {|c| c =~ /[a-z]/ ? ((c.ord % 121) + 2 + (c.ord / 121 * 95)).chr : c }.join
# end
#
# puts t1(text)
# puts
# puts t3(text)
# puts
# puts t3(text)
#
# # Output:
# # i hope you didnt translate it by hand. thats what computers are for. doing it
# # in by hand is inefficient and that's why this text is so long. using
# # string.maketrans() is recommended. now apply on the url.
#
# text = "http://www.pythonchallenge.com/pc/def/map.html"
# puts
# puts t1(text)

# Output:
# jvvr://yyy.ravjqpejcnngpig.eqo/re/fgh/ocr.jvon

# The url doesn't work. But we we can try replacing `map` with the last bit `ocr`:
#
#   http://www.pythonchallenge.com/pc/def/ocr.html
#
# Bingo.

puts t1('IQNlQSL'.downcase)
puts t1('OEKiVEY'.downcase)
puts t1('ZADnMCZ'.downcase)
puts t1('ZUTkLYN'.downcase)
puts t1('CNDeHSB'.downcase)
puts t1('OIXdKBF'.downcase)
puts t1('XJVlGZV'.downcase)
puts t1('ZAGiLQZ'.downcase)
puts t1('CJAsACF'.downcase)
puts t1('KWGtIDC'.downcase)