# Conway's Game of Life in Ruby # 
# http://en.wikipedia.org/wiki/Conway's_Game_of_Life #
# Some code from this excellent article: 
# http://rubyquiz.strd6.com/quizzes/193-game-of-life # 
class Cell 
  attr_writer :neighbors 
  def initialize(seed_probability)
    @alive = seed_probability > rand
  end

  def next!
    @alive = @alive ? (2..3) === @neighbors : 3 == @neighbors
  end

  def to_i 
    @alive ? 1 : 0 
  end

  def to_s 
    @alive ? '◉' : ' '
  end
end

class Game 
  def initialize(width, height, seed_probability, steps) 
    @width, @height, @steps = width, height, steps
    @cells = Array.new(height) { Array.new(width) { Cell.new(seed_probability) } } 
  end

  def play!
    (1..@steps).each do
      sleep(0.05)
      next! 
      system('clear')
      puts self 
    end
  end

  def next! 
    @cells.each_with_index do |row, y| 
      row.each_with_index do |cell, x| 
        cell.neighbors = alive_neighbours(y, x) 
      end 
    end
    @cells.each { |row| row.each { |cell| cell.next! } } 
  end 

  def alive_neighbours(y, x) 
    [[-1, 0], [1, 0], # sides
    [-1, 1], [0, 1], [1, 1], # over 
    [-1, -1], [0, -1], [1, -1] # under 
    ].inject(0) do |sum, pos| 
      sum + @cells[(y + pos[0]) % @height][(x + pos[1]) % @width].to_i
    end 
  end 

  def to_s 
    @cells.map { |row| row.join }.join("\n") 
  end  
end 


width  = (ARGV[0] || 100).to_i
height = (ARGV[1] || 50).to_i
steps  = (ARGV[2] || 1000).to_i
seed_probability = (ARGV[3] || 0.5).to_f

Game.new(width, height, seed_probability, steps).play!