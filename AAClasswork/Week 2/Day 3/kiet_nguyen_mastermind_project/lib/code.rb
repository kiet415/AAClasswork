class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(chars)
    chars.each do |ele|
      return false if !POSSIBLE_PEGS[ele.upcase]
      
    end
    return true
  end
  def initialize(pegs)
    @pegs = []
    if !Code.valid_pegs?(pegs) 
      raise 'does not contain valid pegs'
    else 
      pegs.each do |ele|
        @pegs << ele.upcase
      end
    end

  end
  def pegs
    @pegs
  end

  def self.random(len)
    random = []
    (0...len).each do |ele|
      random << POSSIBLE_PEGS.keys.sample
    end
    Code.new(random)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end
  
  def [](idx)
    @pegs[idx]
  end
  def length 
    @pegs.length
  end

  def num_exact_matches(guess)
    matches = 0
    (0...guess.length).each do |i|
      matches += 1 if @pegs[i] == guess[i] 
    end
    matches
  end
  
  def num_near_matches(guess)
    near_matches = 0
    (0...guess.length).each do |i|
      near_matches +=1 if @pegs[i] != guess[i] && @pegs.include?(guess[i])
    end
    near_matches
  end

  def ==(guess)
    @pegs == guess.pegs
  end
  
end
