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

def second_anagram?(str1, str2)
    str1.each_char do |c| 
        return false if !str2.include?(c)  
        idx = str2.index(c)                
        str2 = str2[0...idx]+str2[idx+1..-1] 
    end

    return true if str2.empty? 
end




def third_anagram?(str1, str2)
    sorted = str1.split("").sort.join("") 
    sorted2 = str2.split("").sort.join("") 
    sorted == sorted2                         
end



def fourth_anagram?(str1, str2)
    hash1 = Hash.new()
    hash2 = Hash.new()
    str1.each_char do |c|
        if hash1[c]
            hash1[c]+=1
        else
            hash1[c]=1
        end 
    end 

    str2.each_char do |c|
        if hash2[c]
            hash2[c]+=1
        else  
            hash2[c]=1
        end   
    end  

    hash1 == hash2
        
end

def fifth_anagram?(str1, str2)
    hash1 = Hash.new()
    str1.each_char do |c|
        if hash1[c]
            hash1[c]+=1
        else
            hash1[c]=1
        end 
    end 

    str2.each_char do |c|
        if hash1[c]
            hash1[c]-=1
        else  
            return false
        end   
    end  

    return true if hash1.values.all?{|e| e == 0}
end


p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true


def bad_two_sum?(arr, sum)
    (0...arr.length).each do |i1|
        (i1+1...arr.length).each do |i2|
            return true if arr[i1] + arr[i2] == sum
        end
    end
    return false
end

def bad_two_sum2?(arr, sum)
    arr = arr.sort
    beg = 0
    ending = arr.length-1
    
    while beg != ending
        if sum > arr[beg] + arr[ending]
            beg +=1
        elsif  sum < arr[beg] + arr[ending]
            ending -=1
        else  
            return true
        end
    end
    return false
end




def two_sum?(arr, sum)
    hash = Hash.new()
    arr.each do |i|
        diff = sum-i
        if hash[diff]
            return true
        else    
            hash[i] =1 
        end   
    end   
    return false

end


p"TWO SUM"
arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

def windowed_max_range(arr, size)
    current_max = -999999
    (0...arr.size).each do |i|
        temp = arr[i...i+size]
        if temp.length == size 
            current_max = temp.max-temp.min if (temp.max-temp.min)>current_max 
        end 
    end
    current_max
end



p "WINDOW!!!!!!"
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) # 6 # 3, 2, 5, 4, 8