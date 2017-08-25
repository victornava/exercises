# source: https://www.hackerrank.com/challenges/time-conversion
#
# Given a time in 12-hour AM/PM format, convert it to military (-hour) time.
#
# Note: Midnight is 12:00:00AM on a 12-hour clock, and 00:00:00 on a 24-hour
# clock. Noon is 12:00:00PM on a 12-hour clock, and 12:00:00 on a 24-hour clock.
#
# Input Format
#
# A single string containing a time in -hour clock format (i.e.:  or ), where 
# and .
#
# Output Format
#
# Convert and print the given time in -hour format, where .
#
# Sample Input
#
# 07:05:45PM
# Sample Output
#
# 19:05:45

require 'time'

def time_conversion(time_string)
  Time.parse(time_string).strftime('%H:%M:%S')
end

def time_conversion_no_lib(time_string)
  hours, mins, secs, meridean = time_string.match(/(\d\d):(\d\d):(\d\d)(AM|PM)/).captures

  new_hours = {
    '12AM'=> '00', '01AM'=> '01', '02AM'=> '02', '03AM'=> '03', '04AM'=> '04', '05AM'=> '05',
    '06AM'=> '06', '07AM'=> '07', '08AM'=> '08', '09AM'=> '09', '10AM'=> '10', '11AM'=> '11',
    '12PM'=> '12', '01PM'=> '13', '02PM'=> '14', '03PM'=> '15', '04PM'=> '16', '05PM'=> '17',
    '06PM'=> '18', '07PM'=> '19', '08PM'=> '20', '09PM'=> '21', '10PM'=> '22', '11PM'=> '23'
  }[hours + meridean]

  "#{new_hours}:#{mins}:#{secs}"
end

test_values = [
  # Input         Target
  ['07:05:45PM', '19:05:45'],
  ['12:00:00AM', '00:00:00'],
  ['12:00:00PM', '12:00:00'],
  ['08:33:17PM', '20:33:17'],
]

puts "Using built-in time library\n\n"
test_values.map do |input, target|
  output = time_conversion(input)
  puts "#{input} -> #{target} == #{output} #{target == output ? '✅' : '❌' }"
end

puts "\nWithout libraries\n\n"
test_values.map do |input, target|
  output = time_conversion_no_lib(input)
  puts "#{input} -> #{target} == #{output} #{target == output ? '✅' : '❌' }"
end
