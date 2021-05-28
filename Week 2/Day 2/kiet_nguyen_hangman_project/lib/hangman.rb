class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end
  attr_accessor :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    return false
  end
  def get_matching_indices(char)
    res = []
      @secret_word.each_char.with_index {|ele,i| res << i if ele == char}
    res
  end
  def fill_indices(char, arr)
    arr.each do |ele|
      @guess_word[ele] = char
    end
  end
  def try_guess(char)
    if self.already_attempted?(char)
      puts 'that has already been attempted' 
      return false
    end
    @attempted_chars << char
    
    
    arr = self.get_matching_indices(char)
    @remaining_incorrect_guesses -= 1  if arr.length == 0 
    self.fill_indices(char, arr)
    return true
  end
  def ask_user_for_guess
    puts "Enter a char:"
    char = gets.chomp
    return self.try_guess(char)

  end
  def win?
    if @guess_word.join("") == @secret_word
      print 'WIN' 
      return true
    end
    return false
  end
  def lose?
    if @remaining_incorrect_guesses == 0
      print 'LOSE'
      return true
    end
    return false
  end
  def game_over?
    if self.win? || self.lose?
      print @secret_word 
      return true
    end
    return false
  end

end
