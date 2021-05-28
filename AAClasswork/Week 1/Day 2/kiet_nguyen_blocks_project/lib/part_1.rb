def select_even_nums(arr)
    arr.select {|ele| ele % 2 == 0}
end

def reject_puppies(arr)
    arr.reject {|ele| ele["age"] < 3}
end

def count_positive_subarrays(arr)
    arr.count do |arr|
        sum = 0
        arr.each {|ele| sum += ele}
        sum > 0
    end
end

def aba_translate(word)
    ctr = 0
    vowels = "aeiou"
    while ctr < word.length
        if vowels.include?(word[ctr])
            
            word = word.slice(0..ctr) + "b" + word.slice(ctr...word.length)
            ctr+=2
        end
        ctr+=1
    end
    
    word
end
def aba_array(arr)
    new_arr = arr.map do |ele|
        aba_translate(ele)
    end
    new_arr
end
