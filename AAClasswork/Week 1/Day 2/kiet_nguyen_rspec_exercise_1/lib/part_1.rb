def average(num1, num2) 
    return (num1 + num2) / 2.0
end

def average_array(arr)
    avg = arr.sum
    return avg / arr.length.to_f
end

def repeat(str, num)
    return str * num
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(str)
    words = str.split
    #p words
    ctr = 0
    while ctr < words.length
        if ctr % 2 == 0
            words[ctr] = words[ctr].upcase
        else
            words[ctr] = words[ctr].downcase
        end
        ctr+=1
    end
    #p words.join(" ")
    return words.join(" ")
end