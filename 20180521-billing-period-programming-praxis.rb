# source: https://programmingpraxis.com/2018/05/18/billing-period/
#
# BILLING PERIOD
#
# Our merchants receive “weekly” invoices, following these rules:
#
# Each Saturday marks the beginning of a new billing period.
# Each 1st of a month marks the begining of a new billing period.
# Within a year, billing periods are numbered consecutively, starting with billing period 1 on January 1st.
# Thus, a billing period can be referenced by a year and period number.
#
# Your task is to write a program that calculates the billing period for a given date.

require 'date'

def billing_period(date_str)
  target_date  = Date.parse(date_str)
  jan_first    = Date.new(target_date.year, 1,1)
  (jan_first..target_date).reduce(0) do |period, date|
    date.day == 1 || date.saturday? ? period + 1 : period
  end
end


def test(method, input, target)
  output = send(method, input)
  puts
  puts "input: #{input.inspect}"
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target ? '✅' : '❌'}"
end

test :billing_period, '2018-01-01', 1
test :billing_period, '2018-01-03', 1
test :billing_period, '2018-01-06', 2
test :billing_period, '2018-01-10', 2
test :billing_period, '2018-01-26', 4
test :billing_period, '2018-02-01', 6
test :billing_period, '2018-05-18', 24
