p "DUOS"
def duos(str)
    res = 0
    (1...str.length).each {|i| res+=1 if str[i] == str[i-1]}
    res
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0

p"SENTENCE_SWAP"
def sentence_swap(str, hash)
    words = str.split(" ")
    words.each_with_index do |ele,i|
        if hash[ele]
            words[i] = hash[ele]
        end
    end
    words.join(" ")
end

p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'

p "HASH_MAPPED"
def hash_mapped(hash, prc, &block)
    res = {}
    hash.each do |k,v|
        res[block.call(k)] = prc.call(v)
    end
    res
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}

p"COUNTED_CHARACTERS"
def counted_characters(str)
    res = []
    map = Hash.new(0)
    str.each_char do |ele|
        map[ele] += 1
        
    end
    map.each do |k,v|
        res << k if v > 2
    end
    res
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []

p"TRIPLET_TRUE?"

def triplet_true?(str)
    return false if str.length < 3
    (0..str.length-3).each do |ele|
        return true if str[ele] == str[ele+1] && str[ele] ==  str[ele+2]
    end
    return false
end

p triplet_true?('caaabb')        # true
p triplet_true?('terrrrrible')   # true
p triplet_true?('runninggg')     # true
p triplet_true?('bootcamp')      # false
p triplet_true?('e')             # false

p"ENERGETIC_ENCODING"
def energetic_encoding(str, hash)
    res = ""
    
    str.each_char do |ele|
        if ele != " "
            if hash[ele]
                res += hash[ele]
            else
                res += "?"
            end
        else 
            res += " "
        end
        
    end


    res
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'
p"UNCOMPRESS"
def uncompress(str)
    res = ""
    ctr = 0
    while ctr < str.length
        res += (str[ctr] * str[ctr+1].to_i)
        
        ctr+=2
    end
    p res
    
end

uncompress('a2b4c1') # 'aabbbbc'
uncompress('b1o2t1') # 'boot'
uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, prc, *args)
    res = []

    arr.each do |ele|
        
        if prc.call(ele)
            flag = true
            args.each do |arg|
                flag = false if !arg.call(ele)
            end
        end
        res << ele if flag
    end

    res
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(word)
    words = word.split(" ")
    res = []
    vowels = "aeiouAEIOU"
    words.each do |ele|
        if ele.length < 3
            res << ele
        elsif vowels.include?(ele[0])
            res << ele + "yay"
        else 
            ele.each_char.with_index do |char, i|
                if vowels.include?(char)
                    res << (char.slice(i..-1) + char.slice(0...i) + "ay") 
                    break
                end
            end
        end
    end

    res.join(" ")
end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"