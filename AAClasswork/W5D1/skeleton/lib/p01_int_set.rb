require 'byebug'
class MaxIntSet
  attr_accessor :store

  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num > @max
    raise "Out of bounds" if num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % num_buckets
    @store[bucket] << num
  end

  def remove(num)
    bucket = num % num_buckets
    @store[bucket].delete(num)
  end

  def include?(num)
    @store.each { |sub| return true if sub.include?(num) }
    return false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      resize! if count == num_buckets
      bucket = num % num_buckets
      @store[bucket] << num 
      @count += 1
    end
  end

  def remove(num)
    bucket = num % num_buckets
    if include?(num)
      @store[bucket].delete(num)
      @count -= 1 
    end
    
  end

  def include?(num)
    @store.each { |sub| return true if sub.include?(num) }
    return false
  end



  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length 
  end

  def resize!
    #debugger
    if @count >= num_buckets
      temp = Array.new(num_buckets * 2) { Array.new }
      @store.each do |bucket| #sub
        bucket.each do |n| #ele
          new_bucket = n % (num_buckets * 2)  
          temp[new_bucket] << n
        end
      end
    end
    @store = temp
  end
end
