require "byebug"
require_relative "card.rb"
require_relative "board.rb"

class Game 
    attr_accessor :board , :previous_guess
    def initialize
        @board = Board.new
        @previous_guess = nil
    end

    def make_guess(pos)
        #debugger
        curr_guess = @board.grid[pos[0]][pos[1]]
        if !@previous_guess #first guess
            @board.reveal(pos) #should set guess face_down to false
            @previous_guess = curr_guess
        else #2nd guess
            if @previous_guess.==(curr_guess)
                @board.reveal(pos)
            else
                @board.reveal(pos)
                @board.render
                sleep(2)
                curr_guess.hide
                @previous_guess.hide
            end
            @previous_guess = nil
    
        end
    end
    def play
        while !@board.won?
            system("clear")
            @board.render
            puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"  
            pos = gets.chomp.split(' ').map(&:to_i)
            raise 'Sorry, wrong position' if pos.length != 2
            make_guess(pos)
        end
        puts "YOU WIN!"
        return true
    end
end

[#<Card:0x000055f92121e308 @face_down=true, @value="N">,
  #<Card:0x000055f92121e2e0 @face_down=true, @value="U">,
  #<Card:0x000055f92121e2b8 @face_down=true, @value="L">,
  #<Card:0x000055f92121e268 @face_down=true, @value="Q">],
 [#<Card:0x000055f92121e218 @face_down=true, @value="Y">,
  #<Card:0x000055f92121e1f0 @face_down=true, @value="B">,
  #<Card:0x000055f92121e1c8 @face_down=true, @value="Z">,
  #<Card:0x000055f92121e1a0 @face_down=true, @value="Y">],
 [#<Card:0x000055f92121e150 @face_down=true, @value="Z">,
  #<Card:0x000055f92121e128 @face_down=true, @value="N">,
  #<Card:0x000055f92121e100 @face_down=true, @value="L">,
  #<Card:0x000055f92121e0d8 @face_down=true, @value="F">],
 [#<Card:0x000055f92121e088 @face_down=true, @value="U">,
  #<Card:0x000055f92121e060 @face_down=true, @value="F">,
  #<Card:0x000055f92121e038 @face_down=true, @value="B">,
  #<Card:0x000055f92121df98 @face_down=true, @value="Q">]]