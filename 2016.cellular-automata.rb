# https://programmingpraxis.com/2009/05/15/cellular-automata/#comment-62491
#
# Cellular Automata
#
# A cellular automaton is a collection of cells arranged in an infinite grid,
# controlled by a clock, with each cell coloring itself at each tick of the clock
# based on the state of its neighboring cells. A linear cellular automaton has
# all the cells of the grid arranged in a single line. A time-lapse picture of a
# linear cellular automaton shows a two-dimensional grid with the automaton as a
# horizontal line, the state of the automaton at each clock tick flowing down the
# page.
#
# For the elementary cellular automata that we will study, each cell may be
# either of two colors, black or white, and a cell’s neighborhood consists of
# itself and the two cells on either side. With two colors and three neighbors,
# there are 23=8 states and 28=256 possible rules for advancing from one state to
# the next.
#
# Rules are specified using a kind of binary notation; for each of the eight
# states 111, 110, 101, 100, 011, 010, 001, and 000, where 1 is black and 0 is
# white and the neighbors are arranged left-to-right on the line. Then the rule
# is specified by the binary number corresponding to the eight successor states
# of each of the eight neighbors, so for instance rule 30 = 000111102 maps 111 to
# 0, 110 to 0, 101 to 0, 100 to 1, 011 to 1, 010 to 1, 001 to 1, and 000 to 0.
#
# For example, the first 12 rows of the rule 158 automaton applied to a row
# containing a single black cell are shown below:
#
#                         X
#                       X X X
#                     X X X   X
#                   X X X     X X
#                 X X X   X X X   X
#               X X X     X X     X X
#             X X X   X X X   X X X   X
#           X X X     X X     X X     X X
#         X X X   X X X   X X X   X X X   X
#       X X X     X X     X X     X X     X X
#     X X X   X X X   X X X   X X X   X X X   X
#   X X X     X X     X X     X X     X X     X X
# X X X   X X X   X X X   X X X   X X X   X X X   X

def nextState(rule, state)  
  rule_in_binary = ("%08b" % rule).chars.reverse
  rule_in_binary[state.join.to_i(2)]
end

def cellState(xs, i)
  [
    (i - 1 < 0)             ? "0" : xs[i - 1],
    xs[i],
    (i + 1 > (xs.size - 1)) ? "0" : xs[i + 1]
  ]
end
  
def nextGeneration(rule, row)
  row.size.times.map do |i|
    nextState(rule, cellState(row, i))
  end
end

def formatState(state)
  state.map { |x| x == "0" ? " " : "█" }.join
end

def show(rule:, cols:, rows:)
  state = cols.times.map { "0" }
  state[(cols/2).floor] = "1"
  
  puts formatState(state)
  
  rows.times.map do |memo, x| 
    state = nextGeneration(rule, state)
    puts formatState(state)
    state
  end
end

show(rule: 30, cols: 31, rows:15)                

__END__

# Notes

rule 30 = 00011110 maps to

111 to 0
110 to 0
101 to 011
100 to 1
011 to 1
010 to 1
001 to 1
000 to 0

rule 0

111 to 0
110 to 0
101 to 0
100 to 0
011 to 0
010 to 0
001 to 0
000 to 0

rule 1

111 to 0
110 to 0
101 to 0
100 to 0
011 to 0
010 to 0
001 to 0
000 to 1

rule 2

111 to 0
110 to 0
101 to 0
100 to 0
011 to 0
010 to 0
001 to 1
000 to 0

So first step is

convert the rule number to binary

30.to_s(2) 11110

can skip that for now

so how do we determine de next state?
  
nextState = ?

we need to define a mapping like this

for that we convert the state to decimal
  
rule 30 = 00011110

111 to 0
110 to 0
101 to 0
100 to 1
011 to 1 (let's work with this state)
010 to 1
001 to 1
000 to 0

rule  = 00011110
state = 011
nextState -> 1

so we convert the state to decimal index

011 -> 3

convert the rule to a list           

then 

take the index of the list

[0,0,0,1,1,1,1,0]
         ^
         |
         3

so there are 3 conversions

rule: decimal -> list of binary numbers
state: binary -> decimal

let's try by hand :)

rule = 30 = 00011110

111 : 0
110 : 0
101 : 0
100 : 1
011 : 1
010 : 1
001 : 1
000 : 0

initial = 0001000

0 -> 000 -> 0
0 -> 000 -> 0
0 -> 001 -> 1
1 -> 010 -> 1
0 -> 100 -> 1
0 -> 000 -> 0
0 -> 000 -> 0

[0,0,0,1,1,1,1,0]

---

# Submission

In Ruby. Could be improved...

[sourcecode lang="ruby"]

def nextState(rule, state)  
  rule_in_binary = ("%08b" % rule).chars.reverse
  rule_in_binary[state.join.to_i(2)]
end

def cellState(xs, i)
  [
    (i - 1 < 0)             ? "0" : xs[i - 1],
    xs[i],
    (i + 1 > (xs.size - 1)) ? "0" : xs[i + 1]
  ]
end
  
def nextGeneration(rule, row)
  row.size.times.map do |i|
    nextState(rule, cellState(row, i))
  end
end

def formatState(state)
  state.map { |x| x == "0" ? " " : "#" }.join
end

def show(rule:, cols:, rows:)
  state = cols.times.map { "0" }
  state[(cols/2).floor] = "1"
  
  puts formatState(state)
  
  rows.times.map do |memo, x| 
    state = nextGeneration(rule, state)
    puts formatState(state)
    state
  end
end

show(rule: 30, cols: 31, rows:15) 

[/sourcecode]

outputs:

[sourcecode]

               #               
              ###              
             ##  #             
            ## ####            
           ##  #   #           
          ## #### ###          
         ##  #    #  #         
        ## ####  ######        
       ##  #   ###     #       
      ## #### ##  #   ###      
     ##  #    # #### ##  #     
    ## ####  ## #    # ####    
   ##  #   ###  ##  ## #   #   
  ## #### ##  ### ###  ## ###  
 ##  #    # ###   #  ###  #  # 
## ####  ## #  # #####  #######
  
[/sourcecode]