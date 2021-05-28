require_relative "game.rb"
require_relative "board.rb"

class Card
    attr_accessor  :value , :face_down 
    def initialize(value,face_down = true)
        @value = value
        @face_down = face_down
        
    end

    def hide
        @face_down = true
    end
    def reveal 
        @face_down = false
    end
    def ==(card)  #Card.==(other_card)
        self.value == card.value
    end
end