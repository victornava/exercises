# Peaks
# from: programmingpraxis.com/2019/02/15/peaks/
#
# Given an array of integers, a peak is a subarray of minimal length in which
# the integer values increase and then decrease. For instance, in the array
# [5,5,4,5,4] there is a peak [4,5,4] and in the array
# [6,5,4,4,4,4,4,5,6,7,7,7,7,7,6] there is a peak [6,7,7,7,7,7,6]. Note that
# [4,5,6,7,7,7,7,7,6] shows a pattern of increasing and decreasing values, but
# it is not minimal because the first two items can be removed and the remaining
# subarray remains a peak. The array [5,5,5,5,4,5,4,5,6,7,8,8,8,8,8,9,9,8] has
# two peaks, [4,5,4] and [8,9,9,8].

def find_peaks(xs)
  out = []
  state = :peak_nil
  peak = nil

  xs.size.times do |i|
    x = xs[i]
    next_x = xs[i+1]

    if next_x.nil?
      if state == :peak_off
        out << (peak << x)
      end
      break
    end

    case state
    when :peak_nil
      if x < next_x
        peak = [x]
        state = :peak_in
      end
    when :peak_in
      if x < next_x
        peak = [x]
      else
        peak << x
        if x > next_x
          state = :peak_off
        end
      end
    when :peak_off
      out << (peak << x)
      state = :peak_nil
    else
      raise "🔥 bad state (#{state})"
    end
  end

  out
end

def test(method, input, target)
  output = self.send(method, input)
  puts "input: #{input.inspect}"
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target ? '✅' : '❌'}"
end

test :find_peaks, [5,5,4,5,4], [[4,5,4]]
test :find_peaks, [6,5,4,4,4,4,4,5,6,7,7,7,7,7,6], [[6,7,7,7,7,7,6]]
test :find_peaks, [5,5,5,5,4,5,4,5,6,7,8,8,8,8,8,9,9,8,11], [[4,5,4], [8,9,9,8]]

# I'll come back to this...
