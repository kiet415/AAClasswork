require "byebug"

class Board
  attr_accessor :size
  def initialize(n)
    @grid = Array.new(n) {Array.new(n,:N)} 
    @size = n*n
  end
  
  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(pos,val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    count = 0
    @grid.each do |sub|
        sub.each do |su|
            count += 1 if su == :S
        end
    end
    count
  end
  def attack(pos)
    if self.[](pos) != :S 
        self.[]=(pos,:X)
        return false
    else
        self.[]=(pos,:H)
        puts 'you sunk my battleship!'
        return true
    end
  end
  def place_random_ships
    percentage = (@size * 0.25).floor
    while percentage > self.num_ships
        rand1 = rand(0...@grid.length)
        rand2 = rand(0...@grid.length)
        self[[rand1,rand2]] = :S 
    end
  end
  def hidden_ships_grid
    new_grid = Array.new(@grid.length) {Array.new(@grid.length)}
    #debugger
    (0...@grid.length).each do |i|
        (0...@grid.length).each do |j|
            if @grid[i][j] == :S
                new_grid[i][j] = :N
            else
                new_grid[i][j] = @grid[i][j]
            end
        end
    end
    new_grid
  end
  def self.print_grid(grid)
    grid.each do |sub|
        puts sub.join(" ")
    end
  end
  def cheat
    Board.print_grid(@grid)
  end
  def print
    Board.print_grid(hidden_ships_grid)
  end
  
end
