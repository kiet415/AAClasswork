def palindrome?(str)
    left = 0
    right = str.length-1
    while(left <= right) 
        return false if(str[left] != str[right])
        left+=1
        right-=1
    end
    return true
end

def substrings(str)
    outer = 0
    
    res = []
    temp = ""
    while(outer < str.length)
        inner = outer
        while(inner < str.length)
            temp += str[inner]
            inner+=1
            res << temp
        end
        
        temp = ""
        outer+=1
    end
    res
end

def palindrome_substrings(str)
    words = substrings(str)
    res = []
    words.each do |ele|
        res << ele if palindrome?(ele) && ele.length > 1
    end
    res
end
