class HumanPlayer 
    attr_accessor :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts 'Enter a valid row col position'
        pos = gets.chomp.split(" ").map(&:to_i)
        raise 'invalid row col pos' if pos.length != 2
        pos
    end
end