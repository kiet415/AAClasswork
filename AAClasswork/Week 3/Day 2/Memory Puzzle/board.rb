require_relative "game.rb"
require_relative "card.rb"

class Board 
    attr_accessor :grid 
    def initialize
        @grid = Array.new(4) {Array.new(4," ")}
    end

    def populate
        size = @grid.length * @grid.length #16 ... 8 pairs
        arr = []
        while arr.length < 16
            letter = ("A".."Z").to_a.sample
            if !arr.include?(letter)
                arr << letter
                arr << letter
            end
        end
        
        arr = arr.shuffle #[a,b,a,c,d,b,c]
        counter = 0 
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                @grid[i][j] = Card.new(arr[counter],true)    
                counter += 1
            end
        end
    end

    def render
        @grid.each do |sub|
            sub.each do |ele|
                if ele.face_down
                    print "  _  "   
                else 
                    print "  #{ele.value}  "
                end
            end
            puts 
        end
    end

    def won?
        @grid.each do |sub|
            sub.each do |card|
                return false if card.face_down
            end
        end
        true
    end

    def reveal(pos) #[0,0]

        if self.grid[pos[0]][pos[1]].face_down 
            self.grid[pos[0]][pos[1]].face_down = false
        end
        self.grid[pos[0]][pos[1]].value
    end
    
end 

# 4 x 4

# A B A C    @grid[0][0] = arr[0]
# D B E E 
# C D F F 
# G H G H