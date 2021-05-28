def partition(arr, num)
    res = []
    arr1 = []
    arr2 = []
    
    arr.each do |ele|
        if ele < num
            arr1.push(ele)
        else 
            arr2.push(ele)
        end
    end
    
    res.push(arr1)
    res.push(arr2)
    res
end

def merge(hash1,hash2)
    res = {}
    hash1.each do |key, value|
        res[key] = value
    end
    hash2.each do |key, value|
        res[key] = value
    end
    res
end

def censor(str, arr)
    words = str.split(" ")
    vowels = "aeiou"
    words.each do |ele|
        if arr.include?(ele.downcase)
            ele.each_char.with_index do |char, idx|
                if vowels.include?(char.downcase)
                    ele[idx] = "*"
                end
            end
        end
    end
    words.join(" ")
end

def power_of_two?(num)
    ctr = 0
    while(ctr < num)
        return true if(2 ** ctr) == num
        ctr+=1
    end
    return false
end