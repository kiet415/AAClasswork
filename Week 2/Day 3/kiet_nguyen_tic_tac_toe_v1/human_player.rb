require_relative "board"
require_relative "game"

class HumanPlayer 
    attr_accessor :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Enter two valid positions as row col "
        pos = gets.chomp.split(' ')
        raise 'sorry, that was invalid :(' if pos.length != 2
        [pos[0].to_i,pos[-1].to_i]
    end
    
end