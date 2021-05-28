def prime?(num)
    ctr = 2
    if num < 2 
        return false
    end
    while ctr < (num-1)
        return false if num % ctr == 0
        ctr+=1
    end
    return true
end