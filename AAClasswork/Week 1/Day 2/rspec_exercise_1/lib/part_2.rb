def hipsterfy(word)
    vowels = "aeiou"
    ctr = word.length-1
    while ctr >= 0
        if vowels.include?(word[ctr])
            #p word[0...ctr] + word[ctr+1..-1]
            return word[0...ctr] + word[ctr+1..-1]
        end
        ctr-=1
    end
    return word
end

def vowel_counts(string)
    hash = Hash.new(0)
    vowels = "AEIOUaeiou"
    string.each_char do |char|
        if vowels.include?(string[char])
            hash[char.downcase] +=1
        end
    end
    #p hash
    hash
end

def caesar_cipher(msg, number)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    ctr = 0
    while ctr < msg.length
        if alphabet.include?(msg[ctr])
            idx = alphabet.index(msg[ctr])
            msg[ctr] = alphabet[(idx+number) % 26]
        end
        ctr+=1
    end
    #p msg
    msg
end