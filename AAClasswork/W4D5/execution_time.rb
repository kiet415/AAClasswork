def my_min(array)
    min = array[0]
    (1...array.length).each do |i1|
        min = array[i1] if array[i1] < min
    end
    min
end

 list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
 p my_min(list)  # =>  -5


def largest_contiguous_subsum(array)
    max = -999999
    arr2 = []
    (0...array.length).each do |i1|
        temp = []
        (i1...array.length).each do |i2|
            temp << array[i2]
            arr2 << temp
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
    max
end
list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]

                     
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])


def first_anagram?(str1, str2)
    anagram_helper(str1).include?(str2)

end

def anagram_helper(str) #str = cd
    return [str] if str.length == 1
    letter = str[0]
    arr = anagram_helper(str[1...str.length])
    arr2 = []
    arr.each do |e|
        (0..e.length).each do |i|
            str2 = ""
            str2 += e[0...i] #b
            str2 += letter  #a
            str2 += e[i..-1] 
            arr2 += [str2]
        end
    end
    arr2
end


p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true