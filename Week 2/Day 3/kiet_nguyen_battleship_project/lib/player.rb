class Player
    def get_move
        puts 'enter a position with coordinates separated with a
        space like 4 7'
        pos = gets.chomp
        return [pos[0].to_i,pos[-1].to_i]
    end
end
