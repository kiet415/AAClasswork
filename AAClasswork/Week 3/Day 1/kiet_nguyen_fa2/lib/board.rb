class Board

    def initialize(size)
        @size = size
        @grid = Array.new(@size) {Array.new(@size)}

    end
    def size
        @size
    end
    def [](pos)
        @grid[pos[0]][pos[1]]
    end
    def []=(pos,mark)
        @grid[pos[0]][pos[1]] = mark
    end
    def complete_row?(mark)
        @grid.each do |sub|
            return true if sub.all?(mark)
        end
        return false
    end
    def complete_col?(mark)
        temp = @grid.transpose
        temp.each do |sub|
            return true if sub.all?(mark)
        end
        return false
    end
    def complete_diag?(mark)
        diag1 = []
        diag2 = []
        (0...@grid.length).each do |i|
            diag1 << @grid[i][i]
            diag2 << @grid[i][@grid.length - i - 1]
        end
        return true if diag1.all?(mark) || diag2.all?(mark)
        return false
    end
    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
