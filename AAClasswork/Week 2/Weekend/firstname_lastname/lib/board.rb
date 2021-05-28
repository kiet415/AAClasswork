class Board
    def self.build_stacks(stack)
        Array.new(stack) {Array.new(0)}
    end

    def initialize(stacks, max_height)
        @max_height = max_height
        @stacks = Board.build_stacks(stacks)

        raise 'rows and cols must be >= 4' if stacks < 4 || max_height < 4
    end 
    def max_height
        @max_height
    end
    def add(token,idx)
        if @stacks[idx].length < @max_height
            @stacks[idx] << token
            return true
        end
        return false
    end
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def vertical_winner?(token)
        @stacks.each do |ele|
            return true if ele.all?(token) && ele.length == max_height
        end
        return false
    end
    def horizontal_winner?(token)
        (0...@stacks.length).each do |outer|
            temp = []
            (0...@stacks.length).each do |inner|
                temp << @stacks[inner][outer]
            end
            return true if temp.length == @stacks.length && temp.all?(token)
        end
        return false
    end
    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end
end
