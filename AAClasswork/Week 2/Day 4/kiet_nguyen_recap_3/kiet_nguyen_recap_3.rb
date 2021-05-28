def no_dupes?(arr)
    res = []
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end
    hash.each do |k,v|
        res << k if v == 1
    end
    res
end
p"NO_DUPES?"
# Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (1..arr.length).each do |i|
        return false if arr[i] == arr[i-1]
    end
    return true
end
p"NO_CONSECUTIVE_REPEATS?"
# Examples
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new()
    str.each_char.with_index do |ele,i|
        if !hash[ele]
            hash[ele] = [i]
        else
            hash[ele] << i
        end
    end
    hash
end
p"CHAR_INDICES"
# Examples
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    longest = 1
    curr = 1
    res = str[0]
    (1...str.length).each do |i|
        if str[i] == str[i-1]
            curr +=1
            if curr >= longest
                longest = curr
                res = str[i-longest+1..i] 
            end
        else
            curr = 1
        end
    end
    res
end
p "LONGEST_STREAK"

# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    primes = []
    (2...num).each do |ele| 
        flag = true
        (2...ele).each do |el|
            flag = false if ele % el == 0
        end
        primes << ele if flag
    end
    
    (0...primes.length).each do |i|
        (i...primes.length).each do |j|
            return true if primes[i]*primes[j] == num
        end
    end
    return false
end

p "BI_PRIMES?"
# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

def vigenere_cipher(str,keys)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    keyCtr = 0
    str.each_char.with_index do |ele,i|
        keyCtr = 0 if keyCtr == keys.length
        idx = alpha.index(ele)
        str[i] = alpha[(idx+keys[keyCtr]) % 26]
        keyCtr +=1
    end
    str
end

# Examples
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = "aeiou"
    our_vowels = []
    str.each_char {|ele| our_vowels << ele if vowels.include?(ele)}
    #p our_vowels
    vowelCtr = 0
    str.each_char.with_index do |ele,i|
        if vowelCtr == 0 && vowels.include?(ele)
            str[i] = our_vowels[-1] 
            vowelCtr+=1
        elsif vowels.include?(ele)
            str[i] = our_vowels[vowelCtr-1]
            vowelCtr+=1
        end
    end
    str
end
p "VOWEL_ROTATE"
# Examples
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"

#PROC PROBLEMS

class String
    def select(&prc)
        res = ""
        return res if !prc
        self.each_char do |ele|
            res += ele if prc.call(ele)
        end
        res
    end
    def map!(&prc)
        self.each_char.with_index do |ele,i|
            self[i] = prc.call(ele)
        end
        self
    end
end
p"SELECT"
# Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

p"MAP!"
# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

#RECURSION PROBLEMS
def multiply(a,b)
    return 0 if b == 0
    if b < 0
        -(a + multiply(a, (-b) -1 ))
    else 
        a + multiply(a,b-1)
    end
end

p "MULTIPLY"
# Examples
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18

def lucas_sequence(len)
    return [] if len == 0
    return [2] if len == 1
    return [2,1] if len == 2
    res = lucas_sequence(len-1)
    res << (res[-1] + res[-2])
    res
end
p "LUCAS SEQUENCE"
# Examples
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    primes = []
    (2..num).each do |ele| 
        flag = true
        (2...ele).each do |el|
            flag = false if ele % el == 0
        end
        primes << ele if flag
    end
    res = []
    numCtr = 0
    while num != 1
        
        if num % primes[numCtr] == 0
            res << primes[numCtr]
            num /= primes[numCtr]
        else
            numCtr +=1
        end
        
    end
    res
end
p "PRIME_FACTORIZATION"
# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]

