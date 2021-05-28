require_relative "code"

class Mastermind
    def initialize(len)
        @secret_code = Code.random(len)
    end
    def print_matches(guess)
        puts "exact : #{@secret_code.num_exact_matches(guess)}"
        puts "near : #{@secret_code.num_near_matches(guess)}"
    end
    def ask_user_for_guess
        puts 'Enter a code'
        code = Code.from_string(gets.chomp)
        puts print_matches(code)
        @secret_code.==(code)
    end
end
