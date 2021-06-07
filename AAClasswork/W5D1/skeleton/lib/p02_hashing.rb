class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    num = 0
    self.each_with_index do |ele, i|
      num = num.hash ^ (ele.hash + i.hash)
    end
    num
  end
end

class String
  def hash
    alpha = ("a".."z").to_a
    num = 0

    self.each_char.with_index do |ele, i|
      num = num.hash ^ (alpha.index(ele).hash + i.hash)
    end

    num
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    num = 0

    temp = self.keys.sort
    num = num.hash ^ temp.hash
    num

    # arr = []
    # self.each do |k, v|
  end
end
