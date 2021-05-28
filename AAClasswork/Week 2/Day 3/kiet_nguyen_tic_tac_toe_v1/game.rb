require_relative "board"
require_relative "human_player"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @current_player = @player1
        @board = Board.new
    end
    def switch_turn
        if @current_player == @player1
            @current_player = @player2 
        else
            @current_player = @player1
        end
    end
    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos,@current_player.mark)
            if @board.win?(@current_player.mark)
                puts @current_player.mark.to_s + " has won!"
                return
            else
                switch_turn
            end
        end
        puts 'DRAW'
    end
end