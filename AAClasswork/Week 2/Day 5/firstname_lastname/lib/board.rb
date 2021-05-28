class Board
    attr_accessor :max_height
    def self.build_stacks(stacks)
        Array.new(stacks){Array.new(0)}
    end
    def initialize(stacks,max_height)
        if stacks < 4 || max_height < 4
            raise 'rows and cols must be >=4'
        else 
            @max_height = max_height
            @stacks = Board.build_stacks(stacks)
        end
    end
    def add(token, stack_idx)
        if @stacks[stack_idx].length < @max_height
            @stacks[stack_idx] << token
            return true
        end
        return false
    end
    def vertical_winner?(token)
        @stacks.each do |sub|
            return true if sub.length == @max_height && sub.all? {|ele| ele == token} 
        end
        return false
    end

    def horizontal_winner?(token)
        (0...@stacks.length).each do |outer| #subarrays 
           temp = []
            (0...@stacks.length).each do |inner| 
                temp << @stacks[inner][outer] 
            end
            return true if temp.all?{|ele| ele == token} && temp.length == @stacks.length
        end
        return false
    end
    
    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
