def proper_factors(num)
    res = []
    (1...num).each do |ele|
        res << ele if num % ele == 0
    end
    res
end

def aliquot_sum(num)
    factors = proper_factors(num)
    factors.inject(0) { |acc,ele| acc + ele }

end

def perfect_number?(num)
    return true if aliquot_sum(num) == num
    return false
end

def ideal_numbers(n)
    res = []
    ctr = 1
    while(res.length != n)
        res << ctr if perfect_number?(ctr)
        ctr+=1
    end
    res
end