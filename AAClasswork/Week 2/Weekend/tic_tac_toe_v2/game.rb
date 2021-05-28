require_relative 'board.rb'
require_relative 'human_player.rb'
class Game
    def initialize(bSize, *marks)
        @player_marks = []
        marks.each do |mark|
            @player_marks << HumanPlayer.new(mark)
        end
        
        @board  = Board.new(bSize)
        @currP = @player_marks[0]
    end

    def switch_turn
        @player_marks = @player_marks.rotate(1)
        @currP = @player_marks[0]
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