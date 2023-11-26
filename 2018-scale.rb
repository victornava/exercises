# Scale
# Linear scaling function from a domain (x1, x2) to a range (y1, y2)
# see https://github.com/d3/d3-scale

def scale(x1, x2, y1, y2, v, explain=false)
  domain_magnitude = x2 - x1
  range_magnitude  = y2 - y1
  scale_factor     = range_magnitude / domain_magnitude
  diff             = v - x1
  result           = diff * scale_factor + y1
  explanation      = <<-EXPLANATION

First, calculate the scale factor.

The scale factor is the difference between the magnitude of ranges.

The magnitude of a range is the difference between the max value and min value.

So, let's calculate the magnitude of the domain:

  domain_magnitude = x2 - x1 = #{x2} - #{x1} = #{domain_magnitude}

Now the magnitude of the range:

  range_magnitude = y2 - y1 = #{y2} - #{y1} = #{range_magnitude}

Then the scale factor:

  scale_factor = range_magnitude / domain_magnitude = #{range_magnitude} / #{domain_magnitude} = #{scale_factor}

Then calculate the difference of the input and the min value of domain.
Or answer: How far away is the input from the domain min value?

   diff = v - x1 = #{v} - #{x1} = #{diff}

Then multiply diff by the scale factor then add that to the range min val:

   diff * scale_factor + y1 = #{diff} * #{scale_factor} + #{y1} = #{diff * scale_factor + y1}

And the result is:

#{result}

EXPLANATION

  puts explanation if explain
  result
end

# Test

def test(output, target)
  pass = output == target
  if pass
    puts '✅'
  else
    puts "❌"
    puts "target: #{target}"
    puts "output: #{output}"
  end
end

test scale(0, 10, 0, 100, 1), 10
test scale(0, 10, 0, 100, 9.5), 95
test scale(0, 10, -5, 5, 0), -5
test scale(0, 10, -5, 5, 5), 0
test scale(0, 10, -5, 5, 10), 5
test scale(-10, 10, 20, 60, -10), 20
test scale(-10, 10, 20, 60, 0), 40
test scale(-10, 10, 20, 60, 10), 60
test scale(-10, 10, 20, 60, -10), 20
test scale(-10, 10, 20, 60, 0), 40
test scale(-10, 10, 20, 60, 10), 60
test scale(-10, 10, 10, -10, -10), 10
test scale(-10, 10, 10, -10, 0), 0
test scale(-10, 10, 10, -10, 10), -10
test scale(-10, 10, 10, -10, 10), -10
test scale(-10, 10, 10, 10, 10, true), 10
