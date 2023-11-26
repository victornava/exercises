# https://programmingpraxis.com/2016/10/07/sticks/
#
# Sticks
#
# You are given a bunch of sticks, each of integer length. Two sticks can be
# combined into a single, larger stick by a process that costs the sum of the
# lengths of the two sticks. Your goal is to build a single stick combining all
# the original sticks, at minimal cost.
#
# For example, suppose you initially have three sticks of lengths 1, 2, and 4.
# You could combine sticks 2 and 4 at a cost of 6, then combine that stick with
# stick 1 at a cost of 7, for a total cost of 13. But it is better to first
# combine sticks 1 and 2 at a cost of 3, then combine that stick with stick 4 at
# a cost of 7, for a total cost of 10.
#
# Your task is to write a program that combines a bunch of sticks at minimal cost.

def combine(xs, cost=0)
  if xs.size < 2
    cost
  else
    a, b, *rest = xs.sort
    combine([a + b].concat(rest), a + b + cost)
  end
end

combine([]) -> 0
combine([1]) -> 0
combine([2,1,4]) -> 10
combine([24,25,28,4,6,10,9]) -> 270

__END__

1, 2, 4

[1, 2] -> 3
[2, 4] -> 6
[1, 4] -> 5


In order [1, 2, 4]
[1,2] -> { length: 3, cost: 3  }
[3,4] -> { length: 7, cost: 10 }
yields 10

In order [2, 4, 1]
[2, 4] -> { length: 6, cost: 6  }
[6, 1] -> { length: 7, cost: 13 }
yields 13

What's different?

The order in which the combination happens
So we need to find the optimal combination

How do we find the cost of the combination?

we can transform the list like so

[1, 2, 4]

[1, 1]
[2, 2]
[4, 4]

then calculate the length and cost of each

combine(a, b)
  [[a[0], b[0]], ]

combine([1, 1], [2, 2]) -> [3, 3] -> combine([3,3], [4,4]) -> [7,13]

that doesn't work

let's see

combine(sticks: [1, 2], bag: 0
  out: 1 + 2
  bag: 0 + out

combine(sticks: [3, 4], bag: 3
  bag: 3 + 4
  out: 3 + out
  
[[1,2], 3]
  
[1, [2, 4], 0, 0]
[2, [4], 1, 1]
[4, [], 3, 4]

Example from the blog

for a list: 24 25 28 4 6 10 9

1) 4 6 9 10 24 25 28 combine 4 and 6 at a cost of 10
2) 9 10 10 24 25 28 combine 9 and 10 at a cost of 19
3) 10 19 24 25 28 combine 10 and 19 at a cost of 29
4) 24 25 28 29 combine 24 and 25 at a cost of 49
5) 28 29 49 combine 28 and 29 at a cost of 57
6) 49 57 combine 49 and 57 at a cost of 106

There are two things that affect the outcome

- The initial order of the list
- and the order of list during each iteration.

Ahh it seems that the gig is to sort the array each time we're iterating.

[24,25,28,4,6,10,9], 0      -> [4, 6, 9, 10, 24, 25, 28], 0 -> [10, 9, 10, 24, 25, 28], 10
[10, 9, 10, 24, 25, 28], 10 -> [9, 10, 10, 24, 25, 28], 10  -> [19, 10, 24, 25, 28], 29
[19, 10, 24, 25, 28], 29    -> [10, 19, 24, 25, 28], 29     -> [29, 24, 25, 28], 58
[29, 24, 25, 28], 58        -> [24, 25, 28, 29], 58         -> [49, 28, 29], 107
[49, 28, 29], 107           -> [28, 29, 49], 107            -> [57, 49], 164
[57, 49], 164               -> [49, 57], 164                -> [106], 164
[106], 164                  -> [106], 164                   -> 270

got it.

---

SUBMISSION

In Ruby

[sourcecode lang="ruby"]
    
    def combine(xs, cost=0)
      if xs.size < 2
        cost
      else
        a, b, *rest = xs.sort
        combine([a + b].concat(rest), a + b + cost)
      end
    end
    
    combine([]) -> 0
    combine([1]) -> 0
    combine([2,1,4]) -> 10
    combine([24,25,28,4,6,10,9]) -> 270
    
[/sourcecode]

