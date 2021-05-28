# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    ctr = num
    while ctr > 1 
        flag = false
        miniCtr = 2
        while miniCtr < ctr
            if ctr % miniCtr == 0
                flag = true
            end
            miniCtr+=1
        end
        if !flag
            if num % ctr == 0
                return ctr
            end
        end
        ctr-=1
    end
end

def unique_chars?(str) 
    hash = Hash.new(0)
    str.each_char {|char| hash[char] += 1}
    hash.each do |key, value|
        if value > 1
            return false
        end
    end
    return true
end

def dupe_indices(arr)
    hash = Hash.new
    arr.each_with_index do |char , idx |
        if !hash[char]
            hash[char] = [idx]
        else 
            hash[char] = hash[char].push(idx)
        end
    end
    #p hash
    return hash.select {|key, value| value.length > 1}
end

def ana_array(arr1, arr2)
    return false if arr1.length != arr2.length
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    arr1.each {|char| hash1[char] +=1}
    arr2.each {|char| hash2[char] +=1}

    return true if hash1 == hash2
    return false
end
