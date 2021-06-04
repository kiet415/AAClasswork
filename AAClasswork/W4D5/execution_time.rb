def my_min(array)
    min = array[0]
    (0...array.length).each do |i1|
        if array.all?{ |i2| array[i1]<=i2}
            return array[i1]
        end 
    end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def largest_contiguous_subsum(array)
    max = -999999
    arr2 = []
    (0...array.length).each do |i1|
        (i1...array.length).each do |i2|
            arr2 << array[i1..i2]
        end
    end

    arr2.each do |e|
        sum = 0
        (0...e.length).each do |i|
            sum += e[i]
        end
        max = sum if sum > max
    end
    max
end

def largest_contiguous_subsum2(array)
    max = -99999
    curr_sum = -99999
    left = 0
    right = 0
    while l < array.length
        curr_sum += array[right]
        max = curr_sum if curr_sum > max 
        while curr_sum < 0
            curr_sum-=array[left]
            left+=1
        end
        right+=1
    end
    return max
end
list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 5, -6, 9]
curr = 0 
max = 7
                     
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])