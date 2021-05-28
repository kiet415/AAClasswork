def is_prime?(num)
    return false if num < 2
    (2...num).each do |ele|
        return false if num % ele == 0
    end
    return true
end

def nth_prime(num)
    primes = []
    ctr = 2
    while(primes.length != num)
        

        primes << ctr if is_prime?(ctr)

        ctr += 1
    end

    return primes[-1]
end

def prime_range(min, max)
    primes = []
    while min <= max
        primes << min if is_prime?(min)
        min +=1
    end
    return primes
end

