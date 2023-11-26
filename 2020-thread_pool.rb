# 2020-04-23
# We have a list tasks.
# Each task takes a random amount of time to complete.
# We want to work on a few tasks at once to speed things up.
# But not work on all taks at once to avoid abusing resources.
#
# This is a variation of 2020.threads.rb the difference here is that we're using
# a predefined number of threads as opposed to letting threads have party.

def in_parallel(task_list, n_threads: 10, &block)
  queue = Queue.new
  mutex = Mutex.new

  # Put work in the queue
  task_list.each do |n|
    queue << n
  end

  # Create a bunch of threads and have them work on tasks from the queue until
  # there is nothing left
  threads = n_threads.times.map do |n|
    Thread.new(n) do |t|
      puts "t#{t} Hello"
      
      loop do
        # Use mutex to avoid threads poping items from empty queue
        # https://ruby-doc.org/core-2.7.1/Mutex.html
        task = mutex.synchronize do
          queue.empty? ? nil : queue.pop
        end
        
        break if !task
    
        puts "t#{t} Working on task #{task}"
        yield(task)
        puts "t#{t} Task #{task} is done"
      end
      
      puts "t#{t} Bye"
    end
  end
  
  # Wait for all threads to finish.
  threads.each(&:join)
end

task_list = 10.times.to_a

in_parallel(task_list, n_threads: 3) do |task|
  sleep(rand(1..10).to_f / 10)
end

puts "All done"

__END__
Output:

t0 Hello
t2 Hello
t1 Hello
t1 Working on task 0
t0 Working on task 1
t2 Working on task 2
t0 Task 1 is done
t0 Working on task 3
t1 Task 0 is done
t2 Task 2 is done
t2 Working on task 4
t1 Working on task 5
t0 Task 3 is done
t0 Working on task 6
t1 Task 5 is done
t1 Working on task 7
t1 Task 7 is done
t1 Working on task 8
t2 Task 4 is done
t2 Working on task 9
t2 Task 9 is done
t2 Bye
t0 Task 6 is done
t0 Bye
t1 Task 8 is done
t1 Bye
All done