class Board 

    def initialize 
        @grid = Array.new(3) {Array.new(3,"_")}
    end

    def valid?(pos)
        x = pos[0]
        y = pos[1]
        return true if x >=0 && x <= 2 && y>= 0 && y <= 2
        return false
    end
    def empty?(pos)
        return true if @grid[pos[0]][pos[1]] == "_"
        return false
    end
    def place_mark(pos,mark)
        if !valid?(pos) || !empty?(pos)
            raise 'Not avail position'
        else 
            @grid[pos[0]][pos[1]] = mark
        end
    end
    def print 
        @grid.each do |sub|
            p sub
        end
    end
    def win_row?(mark)
        @grid.each do |ele|
            return true if ele.all?{|idx| idx == mark}
        end
        return false
    end
    def win_col?(mark)
        temp = @grid.transpose
        temp.each do |ele|
            return true if ele.all?{|idx| idx == mark}
        end
        return false
    end
    def win_diagonal?(mark)
        return true if @grid[0][0] == mark && @grid[1][1] == mark && @grid[2][2] == mark
        return true if @grid[0][2] == mark && @grid[1][1] == mark && @grid[2][0] == mark
        return false
    end
    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end
    def empty_positions?
        @grid.each do |sub|
            sub.each do |idx|
                return true if idx == '_'
            end
        end
        return false
    end
    
end