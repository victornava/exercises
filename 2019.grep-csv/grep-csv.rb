# Grep-CSV
# from: Programming Praxis
# source: https://programmingpraxis.com/2019/04/09/grep-csv
#
# Regular readers of this blog know that. in my day job, I frequently process
# input files from vendors; almost always, they were created in Excel and arrive
# in CSV format. Sometimes I have to peek inside the files, looking for invalid
# data, and I have commonly used grep for that task. Sometimes grep gives me
# unwanted records, because there is a match in some field that is not the field
# of interested, and I just ignore the extra records. But the other day I had a
# mess, with lots of unwanted records, so I used awk to parse out the fields and
# find the records of interest.
#
# I realized as I was performing that task that it would be useful to have a
# version of grep that understood the CSV file format. So I wrote grep-csv that
# takes a field number (counting from 1, like awk) and a regular expression and
# returns the matching rows of a CSV file.
#
# Your task is to write a grep-csv program. When you are finished, you are
# welcome to read or run a suggested solution, or to post your own solution or
# discuss the exercise in the comments below.

require 'csv'

def grep_csv(csv_str, col, regex_str)
  regex = Regexp.new(regex_str)
  csv_str
    .lines
    .select { |line| CSV.parse_line(line)[col-1] =~ regex }
    .join
end

puts grep_csv(File.read(ARGV[0]), ARGV[1].to_i, ARGV[2])

# Given the `example.csv` file look like this:
#
#   Charles,Dickens,Great Expectations,1861
#   Mark,Twain,The Adventures of Tom Sawyer,1876
#   William,Shakespeare,Julius Caesar,1599
#   Isaac,Newton,Philosophiae Naturalis Principia Mathematica,1687
#
# When we run the program like so:
#
#   ruby grep-csv.rb example.csv 2 "e.*s"
#
#
# The output is:
#
# Charles,Dickens,Great Expectations,1861
# William,Shakespeare,Julius Caesar,1599
