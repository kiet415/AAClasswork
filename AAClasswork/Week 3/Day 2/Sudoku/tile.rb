require_relative "board.rb"
class Tile
    attr_accessor :value, :hard_nums

    def initialize(value, hard_nums = false)
        @value = value
        @hard_nums = hard_nums
    end

end


# 003020600
# 900305001
# 001806400
# 008102900
# 700000008
# 006708200
# 002609500
# 800203009
# 005010300