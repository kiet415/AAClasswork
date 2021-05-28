def element_count(arr)
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1}
    hash
end

def char_replace!(str, hash)
    str.each_char.with_index do |ele, i|
        if hash[ele]
            str[i] = hash[ele]
        end
    end
    str
end

def product_inject(arr)
    arr.inject(1) {|acc,el| acc * el}
    
end
