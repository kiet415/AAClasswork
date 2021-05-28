def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    words = str.split(" ")
    res = []

    words.each do |ele|
        res.push(prc.call(ele))
        #p res
    end 
    res.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    num1 = prc1.call(num)
    num2 = prc2.call(num)
    if num1 > num2
        return num1
    end
    return num2
end

def and_selector(arr, prc1, prc2)
    res = []
    arr.each do |ele|
        if(prc1.call(ele) && prc2.call(ele))
            res << ele
        end
    end
    res
end

def alternating_mapper(arr, prc1, prc2)
    res = []
    arr.each_with_index do  |ele, idx|
        if idx % 2 == 0
            res << prc1.call(ele)
        else 
            res << prc2.call(ele)
        end
    end
    res
end