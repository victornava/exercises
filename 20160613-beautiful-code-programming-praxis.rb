# https://programmingpraxis.com/2009/09/11/beautiful-code/
#
# Beautiful Code
#
# In their book The Practice of Programming, Brian Kernighan and Rob Pike present
# this code for matching simple regular expressions consisting of literal
# characters, a dot matching any character, a star consisting of zero or more
# repetitions of the preceding character, and a caret and a dollar sign
# representing the beginning or end of the search string:
#
# /* match: search for re anywhere in text */
# int match(char *re, char *text)
# {
#    if (re[0] == '^')
#       return matchhere(re+1, text);
#    do { /* must look at empty string */
#       if (matchhere(re, text))
#          return 1;
#    } while (*text++ != '\0');
#    return 0;
# }
#
# /* matchhere: search for re at beginning of text */
# int matchhere(char *re, char *text)
# {
#    if (re[0] == '\0')
#       return 1;
#    if (re[1] == '*')
#       return matchstar(re[0], re+2, text);
#    if (re[0] == '$' && re[1] == '\0')
#       return *text == '\0';
#    if (*text!='\0' && (re[0]=='.' || re[0]==*text))
#       return matchhere(re+1, text+1);
#    return 0;
# }
#
# /* matchstar: search for c*re at beginning of text */
# int matchstar(int c, char *re, char *text)
# {
#    do { /* a * matches zero or more instances */
#       if (matchhere(re, text))
#          return 1;
#    } while (*text!='\0' && (*text++==c || c=='.'));
#    return 0;
# }
#
# Your task is to port the code to your favorite language. You should use the
# features and idioms of your language, while simultaneously preserving the
# beauty of Rob Pike’s regular expression matcher. When you are finished, you are
# welcome to read or run a suggested solution, or to post your solution or
# discuss the exercise in the comments below.

module Enumerable
  def tail ; drop(1) ; end
end

def match(regex, string)
  _match(regex.chars, string.chars)
end

def _match(re, text)
  return match_here(re.tail, text) if re.first == '^'
  return false if text.empty?
  return true if match_here(re, text)
  _match(re, text.tail)
end

def match_here(re, text)
  return match_star(re.first, re.drop(2), text) if re[1] == '*'
  return text.empty? if re.first == '$'
  return match_here(re.tail, text.tail) if text.any? && char_match?(re.first, text.first)
  re.empty?
end

def match_star(c, re, text)
  return true  if match_here(re, text)
  return false if text.empty? || !char_match?(c, text.first)
  match_star(c, re, text.tail)
end

def char_match?(l, r)
  l == r || l == '.'
end

# Test code

def test(subject, target, message)
  result = (subject == target) ? 'YES' : 'NOP'
  puts "#{result}  #{subject.inspect} = #{target.inspect} : #{message}"
end

test match("a", "a"), true, '("a", "a")'
test match("a", "b"), false, '("a", "b")'
test match("a", "ab"), true, '("a", "ab")'
test match("a", "ba"), true, '("a", "ba")'
test match("ab", "ab"), true, '("ab", "ab")'
test match("ab", "ba"), false, '("ab", "ba")'
test match("ab", "xab"), true, '("ab", "xab")'
test match("ab", "aab"), true, '("ab", "aab")'
test match("a.c", "ac"), false, '("a.c", "ac")'
test match("a.c", "abc"), true, '("a.c", "abc")'
test match("a.c", "xac"), false, '("a.c", "xac")'
test match("a.c", "xabcx"), true, '("a.c", "xabcx")'
test match("^ab", "ab"), true, '("^ab", "ab")'
test match("^ab", "ba"), false, '("^ab", "ba")'
test match("^ab", "aab"), false, '("^ab", "aab")'
test match("^ab", "abc"), true, '("^ab", "abc")'
test match("ab$", "ab"), true, '("ab$", "ab")'
test match("ab$", "ba"), false, '("ab$", "ba")'
test match("ab$", "aab"), true, '("ab$", "aab")'
test match("ab$", "abc"), false, '("ab$", "abc")'
test match("^ab$", "ab"), true, '("^ab$", "ab")'
test match("^ab$", "ba"), false, '("^ab$", "ba")'
test match("^ab$", "abc"), false, '("^ab$", "abc")'
test match("^ab$", "aba"), false, '"^ab$", "aba")'
test match("a.*c", "ac"), true, '("a.*c", "ac")'
test match("a.*c", "abc"), true, '("a.*c", "abc")'
test match("a.*c", "abbc"), true, '("a.*c", "abbc")'
test match("a.*c", "cbba"), false, '("a.*c", "cbba")'
test match("aa*", "x"), false, '("aa*", "x")'
test match("aa*", "a"), true, '("aa*", "a")'
test match("aa*", "aa"), true, '("aa*", "aa")'
test match("aa*", "ba"), true, '("aa*", "ba")'
test match("a*a*a", "a"), true, '("a*a*a", "a")'
test match("a*a*a", "aaa"), true, '("a*a*a", "aaa")'
test match("a*a*a", "xxxxx"), false, '("a*a*a", "xxxxx")'
test match("a*a*a", "xxxxx"), false, '("a*a*a", "xxxxx")'