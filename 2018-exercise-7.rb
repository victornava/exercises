# Source: https://programmingpraxis.com/2018/06/01/exercise-7/
#
# Exercise 7 by programmingpraxis
# This must be somebody's homework:
#
# You are given an input file containing lines with three pipe-separated fields;
# the first field is a student number (a positive integer), the second field is
# a class name (a string), and the third field is the grade the student received
# for the class (a non-negative integer, no greater than 100):
#
# 22|Data Structures|45
# 23|English|52
# 22|English|51
# 26|Data Structures|72
# 23|Data Structures|61
# 21|English|81
#
# You are to output a list of class names along with the grade earned by the
# lowest-numbers student in each class. For instance, given the above data, the
# output for Data Structures is 45 corresponding to student 22 (with student
# number lower than 23 or 26, who also took Data Structures) and the output for
# English is 81 corresponding to student 21 (with student number lower than 22
# or 23, who also took English).

require 'csv'

def fn(csv)
  CSV
    .parse(csv, col_sep: '|')
    .group_by { |_, c_name, _| c_name }
    .map do |c_name, row|
      [c_name, row.min_by { |s_num, _| s_num.to_i }.last]
    end
end

# Test
def test(target, output, input)
  puts
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target ? '✅' : '❌'}"
end

scores = <<-SCORES
22|Data Structures|45
23|English|52
22|English|51
26|Data Structures|72
23|Data Structures|61
21|English|81
SCORES

target = [
  ['Data Structures', '45'],
  ['English',         '81']
]

test target, fn(scores), scores