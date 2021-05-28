#Write a method strange_sums that accepts an array of numbers as an argument. 
#The method should return a count of the number of distinct pairs of elements that have a sum of zero. 
#You may assume that the input array contains unique elements.
p "STRANGE SUMS"
def strange_sums(arr)
    outer = 0
    inner = 1
    total = 0
    while outer < arr.length
        while inner < arr.length
            total += 1 if  (arr[outer] + arr[inner] == 0)
            #p arr[inner] + arr[outer]
            inner+=1
        end
        
        outer+=1
        inner = outer+1
    end
    total
end
p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0

#Write a method pair_product that accepts an array of numbers and a product as arguments. 
#The method should return a boolean indicating whether or not a pair of distinct
#elements in the array result in the product when multiplied together. 
#You may assume that the input array contains unique elements.
p "PAIR PRODUCT"
def pair_product(arr, prod) 
    outer = 0
    inner = 1
    while outer < arr.length
        while inner < arr.length
            return true if  (arr[outer] * arr[inner] == prod)
            inner+=1
        end
        
        outer+=1
        inner = outer+1
    end
    return false
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

#Write a method rampant_repeats that accepts a string and a hash as arguments. 
#The method should return a new string where characters of the original string are repeated the number
#of times specified by the hash. If a character does not exist as a key of the hash, then it should remain unchanged.
p "RAMPANT_REPEATS"
def rampant_repeats(str, hash)
    res = ""
    str.each_char do |ele|
        if hash[ele]
            res += ele * hash[ele]
        else 
            res += ele
        end
    end


    res
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

#Write a method perfect_square? that accepts a number as an argument. The method should return a boolean
#indicating whether or not the argument is a perfect square. A perfect square is a number that 
#is the product of some number multiplied by itself. For example, since 64 = 8 * 8 and 
#144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.
p "PERFECT SQUARE"
def perfect_square?(num)
    ctr = 1
    prod = 0
    while(prod < num) 
        prod = ctr * ctr
        return true if prod == num
        ctr +=1
    end
    return false
end

p perfect_square?(1)     # true
p perfect_square?(4)     # true
p perfect_square?(64)    # true
p perfect_square?(100)   # true
p perfect_square?(169)   # true
p perfect_square?(2)     # false
p perfect_square?(40)    # false
p perfect_square?(32)    # false
p perfect_square?(50)    # false

#Write a method anti_prime? that accepts a number as an argument. The method should return true if the given
#number has more divisors than all positive numbers less than the given number. For example, 24 is an anti-
#prime because it has more divisors than any positive number less than 24.
#Math Fact: Numbers that meet this criteria are also known as highly composite numbers.
p "ANTI PRIME"
def anti_prime?(num)
    [1,2,3,4,6,8,12,24]

    main_divisors = []
     
    ctr = 1
    while ctr <= num
        if num % ctr == 0
            main_divisors.push(ctr)
        end
        ctr += 1
    end
    
    otherNums = num-1 #23
    while otherNums != 0

        return false if helper(otherNums) >= main_divisors.length
        otherNums -=1
    end
    
    return true
end

def helper(num) 
    divisors = []
    (1...num).each do |ele|
        divisors.push(ele) if num % ele  == 0
    end

    divisors.length
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false

#Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition that accepts two
#matrices as arguments. The two matrices are guaranteed to have the same "height" and "width". The method
#should return a new matrix representing the sum of the two arguments. To add matrices, we simply
#add the values at the same positions:
p "MATRIX ADDITION"
def matrix_addition(mat1, mat2) 
    newMat = Array.new(mat1.length){Array.new(mat1[0].length)}
    inner = 0
    outer = 0
    while outer < mat1.length
        while inner < mat1[outer].length
            newMat[outer][inner] = (mat1[outer][inner] + mat2[outer][inner])
            inner+=1
        end
        inner = 0
        outer+=1
    end
    newMat
end


matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

#Write a method mutual_factors that accepts any amount of numbers as arguments. The method should return
#an array containing all of the common divisors shared among the arguments. For example, the common divisors of
#50 and 30 are 1, 2, 5, 10. You can assume that all of the arguments are positive integers.
p "MUTUAL FACTORS"
def mutual_factors(*args)
    min = args.min
    res = []
    flag = true
    (1..min).each do |ele|
        args.each do |arg|
            if arg % ele != 0 
                flag = false
            end
        end

        res << ele if flag 
        flag = true
    end
    res
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]

#The tribonacci sequence is similar to that of Fibonacci. The first three numbers of the tribonacci sequence are
#1, 1, and 2. To generate the next number of the sequence, we take the sum of the previous three numbers.
#The first six numbers of tribonacci sequence are:
#1, 1, 2, 4, 7, 13, ... and so on

#Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number
# of the tribonacci sequence.
p "TRIBONACCI NUMBER"

def tribonacci_number(num)
    arr = [1,1,2]
    ctr = 3
    while ctr <= num
        arr[ctr] = arr[ctr-3] + arr[ctr-2] + arr[ctr-1]
        ctr+=1
    end
    arr[num-1]
end



p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274

#Write a method matrix_addition_reloaded that accepts any number of matrices as
#arguments. The method should return a new matrix representing the sum of the arguments. Matrix addition can
#only be performed on matrices of similar dimensions, so if all of the given matrices do not have the same "height"
#and "width", then return nil.
p "MATRIX ADDITION RELOADED"

def matrix_addition_reloaded(*args)
    width = args.length
    height = args[0].length
    newMat = Array.new(args[0].length){Array.new(args[0][0].length)}
    newMat.fill(0)
    return nil if args.length != width
    args.each do |ele|
        return nil if ele.length != height
    end

    

    newMat
end



matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

#Write a method squarocol? that accepts a 2-dimensional array as an argument. The method should return a
#boolean indicating whether or not any row or column is completely filled with the same element. You may assume
#that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.
p "SQUAROCOL"
def squarocol?(arr)
    (0...arr.length).each do |ele|
        return true if checkRows(arr[ele])
    end

    arr = arr.transpose
    #p arr

    (0...arr.length).each do |ele|
        return true if checkRows(arr[ele])
    end
    return false
end
def checkRows(arr)
    ctr = 1
    while ctr < arr.length
        return false if arr[ctr] != arr[ctr-1]
        ctr+=1
    end

    return true
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

#Write a method squaragonal? that accepts 2-dimensional array as an argument. The method should return a
#boolean indicating whether or not the array contains all of the same element across either of its diagonals. You may
#assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.
p "SQUARAGONAL?"

def squaragonal?(arr)

end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

#Pascal's triangle is a 2-dimensional array with the shape of a pyramid. The top of the pyramid is the number 1. To
#generate further levels of the pyramid, every element is the sum of the element above and to the left with the element
#above and to the right. Nonexisting elements are treated as 0 when calculating the sum. For example, here
#are the first 5 levels of Pascal's triangle:
#1
#1 1
#1 2 1
#1 3 3 1
#1 4 6 4 1

#Write a method pascals_triangle that accepts a positive number, n, as an argument and returns a 2-dimensional
#array representing the first n levels of pascal's triangle.
p "PASCALS TRIANGLE"
def pascals_triangle(num)
    res = []
    (0...num).each do |ele|
        temp = []
        (0..ele).each do |idx|
            if idx == 0 || idx == ele
                temp << 1
            else 
                temp << res[ele-1][idx] + res[ele-1][idx-1]
                #temp << 0
            end
           
        end
        #p res
        res << temp
        
    end
    res

end

012
p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

#A "Mersenne prime" is a prime number that is one less than a power of 2. This means that it is a prime number with
#the form 2^x - 1, where x is some exponent. For example:

#3 is a Mersenne prime because it is prime and 3 = 2^2 - 1
#7 is a Mersenne prime because it is prime and 7 = 2^3 - 1
#11 is not a Mersenne prime because although it is prime, it does not have the form 2^x - 1

#The first three Mersenne primes are 3, 7, and 31. Write a method mersenne_prime that accepts a
#number, n, as an argument and returns the n-th Mersenne prime.
p "MERSENNE PRIME"

def mersenne_prime(num) 
    powers = 1
    primes = []
    while(primes.length != num+1)
        currNum = (2 ** powers) - 1
        if checkPrime(currNum)
            primes << currNum
        end
        powers+=1
        
    end
    return primes[-1]
end

def checkPrime(num)
    (2...num).each do |ele|
        return false if num % ele == 0
    end
    return true
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071

#A triangular number is a number of the form (i * (i + 1)) / 2 where i is some positive integer. Substituting
#i with increasing integers gives the triangular number sequence. The first five numbers of the triangular number
#sequence are 1, 3, 6, 10, 15. Below is a breakdown of the calculations used to obtain these numbers:

#i	(i * (i + 1)) / 2
#1	1
#2	3
#3	6
#4	10
#5	15

#We can encode a word as a number by taking the sum of its letters based on their position in the alphabet. For
#example, we can encode "cat" as 24 because c is the 3rd of the alphabet, a is the 1st, and t is the 20th:

#Write a method triangular_word? that accepts a word as an argument and returns a boolean indicating whether or
#not that word's number encoding is a triangular number. You can assume
#that the argument contains lowercase letters.
p "TRIANGULAR WORD"
def triangular_word?(word)
    
    tri_numbers = []
    (1..20).each do |ele|
        tri_numbers << (ele * (ele + 1) / 2)
    end
    return true if tri_numbers.include?(sum(word))
    return false
end

def sum(word) 
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    total = 0
    word.each_char do |char|
        total += alphabet.index(char) + 1
    end
    total
end
p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false