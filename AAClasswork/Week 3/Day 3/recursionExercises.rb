require "byebug"
def iter_range(start,last)
    res = []
    (start..last).each do |i|
        res << i
    end
    res
end
#If end < start, you can return an empty array.
def rec_range(start,last)
    return [] if last < start
    return [start] if start == last-1
    
    rec_range(start,last-1) << last-1

end

#p rec_range(1,5)

def expo(base,power)
  return 1 if power == 0
  
  base * expo(base,power-1)
end

def expo2(base,power)
  return 1 if power ==0  #exp(b, 0) = 1
  return base if power == 1 #exp(b, 1) = b

    if power % 2 == 0
      expo2(base,power/2) * expo2(base,power/2)
    else
      base * (expo2(base,(power-1)/2)) * (expo2(base,(power-1)/2))
    end
    #exp(b, n) = exp(b, n / 2) ** 2             [for even n]
    #exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

end

# p expo(3,4)
# p expo2(3,4) #32

#Using recursion and the is_a? method, write an Array#deep_dup 
#method that will perform a "deep" duplication of the interior arrays.
#you should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].
class Array
    def deep_dup
        # debugger
        return self if !self.is_a?(Array)
        new_arr = []
          
        self.each do |ele|
            if ele.is_a?(Array)
                new_arr << ele.deep_dup
            else
                new_arr << ele
            end
        end
        new_arr
    end
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.deep_dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs" # => ["capacitors", "resistors", "inductors", "LEDs"]
# # but it does
# p robot_parts_copy
# p robot_parts[1] # => ["capacitors", "resistors", "inductors"]

def rec_fib(n)
  return [0] if n == 0
  return [0,1] if n ==1
  return [0,1,1] if n ==2
  
  rec_fib(n-1) << (rec_fib(n-1)[-1] + rec_fib(n-2)[-1]) 

end

def iter_fib(n)
  res = [0,1,1]
  return res[0..n] if n < 3 

  while res.length <= n
    res.push(res[-1]+res[-2])
  end
  res
end
#p fibonacci(6) # [0,1,1,2,3,5,8]
#p iter_fib(2)


def bsearch(arr,target)
    return nil if arr.length == 0 
    midIdx = arr.length/2
    mid = arr[midIdx] 
    if mid > target  #left half
        bsearch(arr[0...midIdx],target)
    elsif mid < target #right half

        idx = bsearch(arr[midIdx+1..-1],target)
        if idx 
            idx + arr[0..midIdx].length
        else
            return nil
        end
         
    else
        return midIdx
    end

end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

class Array
    def merge_sort
        return self if self.length <= 1
        
        left_half = self.length/2 
        right_half = left_half
        # self[0...left_half].merge_sort.merge_helper(self[right_half..-1].merge_sort)

        left = self[0...left_half]
        # p self[0...left_half]
        right = self[right_half..-1]
        # p self[right_half..-1]
        # var.merge_sort
        left.merge_sort.merge_helper(right.merge_sort)
    end
    def merge_helper(arr1)  
        res = []
        ctr1 = 0
        ctr2 = 0
        while res.length != arr1.length + self.length
            if !arr1[ctr1] 
                res << self[ctr2]
                ctr2 += 1
            elsif !self[ctr2]
                res << arr1[ctr1]
                ctr1 += 1
            elsif arr1[ctr1] < self[ctr2]
                res << arr1[ctr1]
                ctr1 += 1
            else arr1[ctr1] > self[ctr2]
                res << self[ctr2]
                ctr2 += 1
            end
             
        end
        res
    end
    
end

# [1] [5] 
# #p [1,5,9,15].merge_helper([2,3,10,11])
 p [1,15,5,9,2,10,3,11].merge_sort
# [1   15    5   9 ]  [2   10   3   11]   #half
# [1 15] [5,9]        [2,10] [3,11]       #half
# [1] [15]  [5] [9]   [2] [10] [3] [11]   #single element BASE CASE
# [1,15]  [5,9]       [2,10] [3,11]       #group by 2
# [1,5,9,15]          [2,3,10,11]         #group by 2 
# [1,2,3,5,9,10,11,15]                    #finish""

# def subsets(array)
#   return [] if array.length == 0

#   array.each do |ele| 
#     ele + subsets(array[1..-1])
#   end
  
# end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) #[1,2,3] [[1],[2],[3] ,[1,2], [1,3] ,[2,3] [1,2,3]]

