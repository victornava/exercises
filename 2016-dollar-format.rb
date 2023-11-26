# https://programmingpraxis.com/2016/09/30/dollar-format/
#
# Dollar Format
#
# We have a simple task today, a function that formats a number in dollar format.
# A number like 1234567.8912 should be rounded to two positions after the decimal
# point, have commas inserted every three positions before the decimal point, and
# have a dollar sign prepended; thus, the function should format 1234567.8912 as
# $1,234,567.89.

def format(amount)
  decimal, fraction = amount.round(2).to_s.split('.')
  decimal_part = decimal.
    chars.
    reverse.
    each_slice(3).
    map { |xs| xs.reverse.join }.
    reverse.
    join(",")

  "$" + decimal_part + "." + fraction.ljust(2, "0")
end

def test(method, input, target)
  output = self.send(method, *input)
  puts method.to_s
  puts "input: #{input}"
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target}"
  puts
end

test :format, 1234567.8912, "$1,234,567.89"
test :format, 234567.8912, "$234,567.89"
test :format, 1, "$1.00"
test :format, 23.45 , "$23.45"
test :format, 0.50 , "$0.50"
test :format, 99.01 , "$99.01"

__END__

Submission

In Ruby

[sourcecode lang="ruby"]

  def format(amount)
    decimal, fraction = amount.round(2).to_s.split('.')
    decimal_part = decimal.
      chars.
      reverse.
      each_slice(3).
      map { |xs| xs.reverse.join }.
      reverse.
      join(",")

    "$" + decimal_part + "." + fraction.ljust(2, "0")
  end
  
[/sourcecode]
