class GuessingGame
    attr_accessor :num_attempts
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end
    def game_over?
        return @game_over
    end

    def check_num(num)
        @num_attempts+=1
        @game_over = true if num == @secret_num
        puts 'you win' if num == @secret_num
        puts 'too small' if num < @secret_num
        puts 'too big' if num > @secret_num

    end
    def ask_user
        puts 'enter a number'
        num = gets
        num = num.chomp.to_i
        check_num(num)
    end

end
