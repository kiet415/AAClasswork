# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str)
    ctr = 1
    count = 1
    res = ""
    while ctr < str.length 
        if(str[ctr] == str[ctr-1]) 
            count+=1
        elsif count == 1
            res += str[ctr-1]
        elsif res += count.to_s + str[ctr-1];
            count = 1;
        end
        ctr+=1
    end
    if count == 1
        res += str[ctr-1]
    else res += count.to_s + str[ctr-1];
        count = 1;
    end
    res
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
