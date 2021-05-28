# Define your methods here.
def string_map!(str, &prc)
    str.each_char.with_index do |ele, i|
        str[i] = prc.call(ele)
    end

    str
end

def three?(arr, &prc)
    count = 0
    arr.each {|ele| count+=1 if prc.call(ele)}

    return true if count == 3
    return false

end

def nand_select(arr, prc1 , prc2)
    res = []
        arr.each do |ele|
            res << ele if (!prc1.call(ele) || !prc2.call(ele))
        end
    res 
end

def hash_of_array_sum(hash)
    sum = 0

    hash.each do |k,v|
        v.each {|val| sum+=val}
    end

    sum
end

def abbreviate(str)
    words = str.split(" ")
    res = []
    vowels = "aeiou"

    words.each do |ele|
        if ele.length > 4
            temp = ""
            ele.each_char do |char|
                if !vowels.include?(char.downcase)
                    temp << char
                end
            end
            res << temp
        else
            res << ele
        end
    end

    res.join(" ")
end

def hash_selector(hash, *args)
    res = {}
    args.each do |ele|
        res[ele] = hash[ele] if hash[ele] 
    end
    return hash if args.length == 0
    res
end