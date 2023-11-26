# We have a list tasks.
# Each task takes a random amount of time to complete.
# We want to work on a few tasks at once to speed things up.
# But not work on all taks at once to avoid abusing resources.

def in_parallel(tasks, max_threads: 10, &block)
  thread_count = 0

  while !tasks.empty?
    puts "Checking for available theards"
    if thread_count >= max_threads
      puts "Going to sleep"
      sleep(0.1)
      puts "Woke up"
      next
    end
    
    thread_count += 1
    puts "Start new thread. thread_count: #{thread_count}"
    Thread.new(tasks.shift) do |task|
      yield(task)
      thread_count -= 1
      puts "Thread finished. thread_count: #{thread_count}"
    end
  end

  
  puts "All done"
  puts "Threads used: #{Thread.list.size}" 
end

def work_on(task)
  puts "Work on #{task} ⏱"
  # Simulate random delay
  sleep(rand(1..10).to_f / 10) 
  puts "Work on #{task} ✅"
end

tasks = (1..30).to_a

in_parallel(tasks) do |task|
  work_on(task)
end