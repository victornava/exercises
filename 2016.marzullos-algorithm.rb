# Marzullo’s Algorithm
#
# This one is tricky:
#
#   Given a list of events with arrival and departure times, write a program that
#   determines the time at which the greatest number events occurred.
#
# For instance, you may have ten employees who arrived at work and departed at
# the times shown below (for instance, employee 9 arrived at 12:00noon and
# departed at 5:00pm):
#
# employee   1  2  3  4  5  6  7  8  9 10
#           -- -- -- -- -- -- -- -- -- --
# arrival   10 12 11 13 14 12  9 14 12 10
# departure 15 14 17 15 15 16 13 15 17 18
#
# Then the maximum employee count was at 2:00pm:
#
#  9 |                    7          | 1
# 10 |  1                 7       10 | 3
# 11 |  1     3           7       10 | 4
# 12 |  1  2  3        6  7     9 10 | 7
# 13 |  1  2  3  4     6  7     9 10 | 8
# 14 |  1  2  3  4  5  6     8  9 10 | 9
# 15 |  1     3  4  5  6     8  9 10 | 8
# 16 |        3        6        9 10 | 4
# 17 |        3                 9 10 | 3
# 18 |                            10 | 1
#
# There were 9 employees at work at time 14.
#
# Your task is to write a program that determines the start and end times of the
# time block where the greatest number of events occurred.

def time_block_with_most_events(events)
  min_t, max_t = events.flatten.minmax
  
  events_on_times = (min_t..max_t).map do |t|
    [ t, events.select { |x, y| t.between?(x, y) }.count ]
  end
  
  max_events  = events_on_times.map { |t, c| c }.max
  time_blocks = events_on_times.select { |t, c| c == max_events }.map(&:first)
  
  [max_events] + time_blocks.minmax
end

def test(output, target)
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target}"
  puts
end

arrivals    =  [10,12,11,13,14,12, 9,14,12,10]
departures1 =  [15,14,17,15,15,16,13,15,17,18]
departures2 =  [15,15,17,15,15,16,15,15,17,18]

events1 = arrivals.zip(departures1)
events2 = arrivals.zip(departures2)

test time_block_with_most_events(events1), [9, 14, 14]
test time_block_with_most_events(events2), [10, 14, 15]


__END__

Submission

[sourcecode lang="ruby"]
  
def time_block_with_most_events(events)
  min_t, max_t = events.flatten.minmax
  
  events_on_times = (min_t..max_t).map do |t|
    [ t, events.select { |x, y| t.between?(x, y) }.count ]
  end
  
  max_events  = events_on_times.map { |t, c| c }.max
  time_blocks = events_on_times.select { |t, c| c == max_events }.map(&:first)  
  [max_events] + time_blocks.minmax
end

arrivals    =  [10,12,11,13,14,12, 9,14,12,10]
departures1 =  [15,14,17,15,15,16,13,15,17,18]
departures2 =  [15,15,17,15,15,16,15,15,17,18]

time_block_with_most_events(arrivals.zip(departures1))
=> [9, 14, 14]
  
time_block_with_most_events(arrivals.zip(departures2))
=> [10, 14, 15]

[/sourcecode]
