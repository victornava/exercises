# Reverse Vowels
# from: https://programmingpraxis.com/2019/06/04/reverse-vowels/
# 
# Given a string, write it with the vowels reversed, maintaining the original
# capitalization of the vowels. For instance, "HELLO world" becomes "HOLLO
# werld" and "Programming PRAXIS" becomes "Prigramming PRAXOS" (I kinda like
# that one).

def reverse_vowels(str)
  vowels = str.scan(/[aeiou]/i)
  str.gsub(/[aeiou]/i) do |c|
    c == c.upcase ? vowels.pop.upcase : vowels.pop.downcase
  end
end

# Test
puts reverse_vowels("HELLO world") == "HOLLO werld"
puts reverse_vowels("Programming PRAXIS") == "Prigramming PRAXOS"