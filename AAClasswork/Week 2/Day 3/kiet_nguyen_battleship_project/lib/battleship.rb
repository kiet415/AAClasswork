require_relative "board"
require_relative "player"

class Battleship
    attr_accessor :board, :player
    def initialize(len)
        @player = Player.new()
        @board = Board.new(len)
        @remaining_misses = @board.size/2
    end
    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end
    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        end
        return false
    end
    def win?
        count = @board.num_ships
        if count == 0
            puts 'you win'
            return true
        end
        return false
    end
    def game_over?
        return true if win? || lose?
        return false
    end
    def turn
        
        if !@board.attack(@player.get_move)
            
            @remaining_misses -= 1
        end

        puts @remaining_misses
        @board.print
        
        
    end
end
