require_relative "human_player"
require_relative "game"

class Board 

    def initialize
        @grid = Array.new(3) {Array.new(3,"_")}
    end
    def valid?(pos)
        return false if pos[0] > 2 || pos[0] < 0 || pos[1] > 2  || pos[1] < 0
        return true
    end
    def empty?(pos)
        return true if @grid[pos[0]][pos[1]] == "_"
        return false
    end
    def place_mark(pos,mark)
        if !valid?(pos) || !empty?(pos)
            raise 'invalid pos'
        else
            @grid[pos[0]][pos[1]] = mark
        end
    end
    def print
        @grid.each do |ele|
            puts ele.join(" ")
        end
    end
    def win_row?(mark)
        @grid.each do |ele|
            return true if ele[0] == mark && ele[1] == mark && ele[2] == mark
        end
        return false
    end

    def win_col?(mark)
        temp = @grid.transpose
        temp.each do |ele|
            return true if ele[0] == mark && ele[1] == mark && ele[2] == mark
        end
        return false
    end
    def win_diagonal?(mark)
        return true if (@grid[0][0] == mark && @grid[1][1] == mark && @grid[2][2] == mark) 
        return true if (@grid[0][2] == mark && @grid[1][1] == mark && @grid[2][0] == mark)
        return false
    end
    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end
    def empty_positions?
        @grid.each do |ele|
            return true if ele.include?("_")
        end
        return false
    end
end

#board = Board.new
#board.place_mark([0,0], 'x')