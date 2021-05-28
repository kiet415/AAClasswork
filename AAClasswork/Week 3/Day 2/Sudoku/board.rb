require "byebug"
require_relative "tile.rb"
class Board

    attr_accessor :grid

    def self.from_file(file) #Board::from_file
        #debugger
        #arr = Array.new(9) {Array.new(9,Tile.new(0,false))}
    
        #currFile = File.open(file)

        currFileData = File.readlines(file).map(&:chomp)
        (0...currFileData.length).each do |i|
            (0...currFileData.length).each do |j|
                if currFileData[i][j] == "0"
                    self[i][j] = Tile.new(0,false) 
                else
                    self[i][j] = Tile.new(currFileData[i][j].to_i,true)
                end
            end
        end
    end

    #def initialize
    #     @grid = Array.new(4) {Array.new(4," ")}
    #end

    # (0...@grid.length).each do |i|
    #     (0...@grid.length).each do |j|
    #         @grid[i][j] = Card.new(arr[counter],true)    
    #         counter += 1
    #     end
    # end

    def initialize
        @grid = Array.new(9) {Array.new(9,0)}
    end
    def [](pos)
        row, col = pos
        @grid[row][col] 
    end

    def []=(pos,val)
        row, col = pos
        tile = @grid[row][col]
        tile.value = val
    end
    
   
end
