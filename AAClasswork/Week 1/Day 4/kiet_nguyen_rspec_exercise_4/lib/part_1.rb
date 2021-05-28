def my_reject(arr, &prc)
    res = []
    arr.each {|ele| res << ele if !prc.call(ele)}
    res
end

def my_one?(arr, &prc)
    ctr = 0
    arr.each {|ele| ctr+=1 if prc.call(ele)}
    return true if ctr == 1
    return false
    
end

def hash_select(hash, &prc)
    res = {}

    hash.each do |k,v|
        res[k] = v if prc.call(k,v)
    end
    res
end

def xor_select(arr, prc1, prc2 )
    res = []

    arr.each do |ele|
        res << ele if(prc1.call(ele) && !prc2.call(ele))    
        res << ele if(!prc1.call(ele) && prc2.call(ele))  
    end


    res

end


def proc_count(num, arr)
    count = 0

    arr.each {|ele| count += 1 if ele.call(num)}

    count
end

