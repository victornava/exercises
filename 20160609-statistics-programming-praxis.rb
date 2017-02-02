# https://programmingpraxis.com/2011/09/27/statistics/
#
# In today’s exercise we calculate some of the basic measures in statistics:
# mean, standard deviation, linear regression, and correlation. The only hard
# part is that different sources use different standard names to refer to the
# different statistics.
#
# Your task is to write functions to compute these basic statistics. When you are
# finished, you are welcome to read or run a suggested solution, or to post your
# own solution or discuss the exercise in the comments below.

def test(subject, target)
  result = ((subject == target) ? '✅' : '❌')
  puts "#{result}  #{subject} = #{target}"
end

def sum(xs)
  xs.reduce(0.0, &:+)
end

def mean(xs)
  sum(xs) / xs.size
end

def standard_deviation(xs)
  n = xs.size
  m = mean(xs)
  dev = -> x { (x - m) ** 2 }
  Math.sqrt(sum(xs.map(&dev)) / (n - 1))
end

def slope(xs, ys)
  n = xs.size
  ((n * (sum(xs.zip(ys).map { |x, y| x * y }))) - (sum(xs) * sum(ys)) ) /
  ((n * sum( xs.map { |x| x ** 2 })) - (sum(xs) ** 2))
end

def intercept(xs, ys)
  mean(ys) - (slope(xs, ys) * mean(xs))
end

def linear_regression(xs, ys)
  [slope(xs, ys), intercept(xs, ys)]
end

def correlation(xs, ys)
  ( sum( xs.zip(ys).map { |x,y| (x - mean(xs)) * (y - mean(ys)) })) /
  ((xs.size - 1) * standard_deviation(xs) * standard_deviation(ys))
end

xs =  [1.47, 1.5, 1.52, 1.55, 1.57, 1.6, 1.63, 1.65, 1.68, 1.7, 1.73, 1.75, 1.78, 1.8, 1.83]
ys =  [52.21, 53.12, 54.48, 55.84, 57.2, 58.57, 59.93, 61.29, 63.11, 64.47, 66.28, 68.1, 69.92, 72.19, 74.46]

test(mean(xs), 1.6506666666666665)
test(mean(ys), 62.078)
test(standard_deviation(xs), 0.11423451233985206)
test(standard_deviation(ys), 7.037514983490772)
test(linear_regression(xs, ys), [61.272186542107434, -39.06195591883866])
test(correlation(xs, ys), 0.9945837935768895)