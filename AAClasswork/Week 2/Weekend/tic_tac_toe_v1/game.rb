require_relative 'board.rb'
require_relative 'human_player.rb'
class Game
    def initialize(p1_mark,p2_mark)
        @p1 = HumanPlayer.new(p1_mark)
        @p2 = HumanPlayer.new(p2_mark)
        @board  = Board.new
        @currP = @p1
    end

    def switch_turn
        @currP == @p1 ? @currP = @p2 : @currP = @p1
    end
    
    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@currP.get_position,@currP.mark)
            if @board.win?(@currP.mark)
                print @currP.mark.to_s + ' has won!'
                return
            else
                switch_turn
            end
        end
        print 'DRAW'
    end
    
end