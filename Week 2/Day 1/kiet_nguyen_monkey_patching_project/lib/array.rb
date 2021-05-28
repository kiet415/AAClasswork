# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    small = self[0]
    big = self[0]
    self.each do |ele| 
        if ele < small
            small = ele
        elsif ele > big
            big = ele
        end
    end
    return big - small
  end

  def average
    return nil if self.length == 0
    avg = 0
    self.each do |ele|
        avg += ele
    end
    return avg / (self.length*1.0)
  end

  def median
    return nil if self.length == 0
    sorted = self.sort
    return sorted[(sorted.length/2).floor] if sorted.length % 2 == 1
    return (sorted[sorted.length/2] + sorted[(sorted.length/2) - 1]) / 2.0
  end

  def counts
    res = Hash.new(0)
    self.each {|ele| res[ele] += 1}
    res
  end

  def my_count(num)
    res = 0
        self.each {|ele| res+=1 if ele == num}
    res
  end

  def my_index(num)
    self.each_with_index {|ele,i| return i if ele == num}
    return nil
  end

  def my_uniq
    res = []
    self.each do |ele|
        res << ele if !res.include?(ele)
    end
    res
  end

  def my_transpose
    res = Array.new(self.length) {Array.new(self.length)}
        self.each_with_index do |ele,i| #arrs of arrs
            ele.each_with_index do |el,j|
                res[i][j] = self[j][i]
            end
        end
    res
  end

end
