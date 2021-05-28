# Define your methods here. 
def first_letter_vowel_count(str)
    words = str.split(" ")

    vowels = "aeiou"
    res = 0
    words.each do |ele|
        res +=1 if vowels.include?(ele[0].downcase)
    end
    res
end

def count_true(arr, prc)
    res = 0
    arr.each do |ele|
        res += 1 if prc.call(ele)
    end

    res
end

def procformation(arr, prc1, prc2, prc3)
    res = []
    arr.each do |ele|
        if prc1.call(ele)
            ele = prc2.call(ele)
        else
            ele = prc3.call(ele)
        end
        res << ele
    end

    res
end

def array_of_array_sum(arr)
    sum = 0
    outer = 0
    inner = 0
    while outer < arr.length
        while inner < arr[outer].length
            sum += arr[outer][inner]
            inner+=1
        end
        inner = 0
        outer+=1
    end 
    sum
end

def selective_reverse(str)
    vowels = "aeiou"
    res = []
    words = str.split(" ")

    words.each do |ele|
        #p ele.reverse
        if !vowels.include?(ele[0].downcase) && !vowels.include?(ele[-1])
            res << ele.reverse
        else 
            res << ele
        end

    end

    res.join(" ")
end

def hash_missing_keys(hash, *args)
    arr = []
    return arr if args.length == 0


    args.each do |ele|
        if !hash[ele]
            arr << ele
        end
    end

    arr
end