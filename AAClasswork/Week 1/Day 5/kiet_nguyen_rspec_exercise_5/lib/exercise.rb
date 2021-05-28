require "byebug"

def zip(*args)
    res = []
    (0...args[0].length).each do |idx|
        temp = []
        args.each do |ele|
            
            temp << ele[idx]
        end
        res << temp
        
    end
    res
end

def prizz_proc(arr, prc1, prc2)
    res = []
    arr.each do |ele|
        if (prc1.call(ele) && !prc2.call(ele)) 
            res << ele
        elsif (!prc1.call(ele) && prc2.call(ele))
            res << ele
        end
    end
    res
end

def zany_zip(*args)
    res = []
    max = 0
   
    (0...args.length).each do |idx|
        max = args[idx].length if args[idx].length > max
    end
  
    (0...max).each do |idx|
        temp = []
        args.each do |ele|
            if ele[idx] 
                temp << ele[idx]
            else
                temp << nil
            end
            
        end
        res << temp
    end
    
    res
end

def maximum(arr, &prc)
    
    return nil if arr.length == 0 
    res = arr[0]
    arr.each do |ele|
        res = ele if prc.call(ele) >= prc.call(res)
    end
    res
end

def my_group_by(arr , &prc)
    hash = Hash.new {|h,k| h[k] = []}

    arr.each do |ele|
        hash[prc.call(ele)] << ele
    end
    hash
end

def max_tie_breaker(arr, prc, &block)
    return nil if arr.length == 0
    
    res = arr[0]
    arr.each do |ele|
        if block.call(ele) > block.call(res)
            res = ele 
        elsif block.call(ele) == res && prc.call(ele) > prc.call(res)
            res = ele
        end

        
    end
    res
end

def checkVowels(str)
    vowels = "aeiou"
    vowelsCount = []
    str.each_char.with_index do |ele, i|
       vowelsCount << i if vowels.include?(ele) 
    end
    
    vowelsCount
    
end

def silly_syllables(str)
    res = []
    vowels = "aeiou"
    words = str.split(" ")

    words.each do |ele|
        indexes = checkVowels(ele)
        p indexes
        if indexes.length < 2
            res << ele
        else
            res << ele.slice(indexes[0]..indexes[-1])
        end
    end

    res.join(" ")
end

