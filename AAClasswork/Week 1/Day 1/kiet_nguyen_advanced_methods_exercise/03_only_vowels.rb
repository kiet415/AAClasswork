# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.

def only_vowels?(str)
    ctr = 0
    while ctr < str.length
        if str[ctr] != "a" && str[ctr] != "e" && str[ctr] != "i" && str[ctr] != "o" && str[ctr] != "u"
            return false
        end
        ctr+=1
    end
    return true
end

p only_vowels?("aaoeee")  # => true
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false


