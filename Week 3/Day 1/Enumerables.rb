require 'byebug'
class Array
    def my_each(&prc)
        count = 0
        while count < self.length
            prc.call(self[count])
            count += 1
        end
        self
    end

    def my_select(&prc)
        res = []
        self.my_each {|ele| res << ele if prc.call(ele) }
    #   [1,2,3]
        return res
    end

    def my_reject(&prc)
        res = []
        self.my_each {|ele| res << ele if !prc.call(ele) }

        res
    end

    def my_any?(&prc)
        self.my_each {|ele| return true if prc.call(ele)}
        return false
    end

    def my_flatten
        res = []
            self.my_each do  |ele|
                if !ele.is_a?(Array)  
                    res << ele
                else
                    res += ele.my_flatten  
                end
            end
        res
    end

    def my_zip(*arrays) [ 4, 5, 6 ]
        res = []
        count = 0
        while count < self.length
            temp = []
            temp << self[count]
            arrays.my_each do |sub|
                if !sub[count]
                    temp << nil
                else
                    temp << sub[count]
                end
            end
            count +=1
            res << temp
        end
        res
    end

    def my_rotate(num = 1)  
        res = self
        # debugger
        while num > 0 
            firstEle = res.shift
            res = res.push(firstEle) 
            num -= 1
        end
        while num < 0 
            lastEle = res.pop  
            res = res.unshift(lastEle) 
            num += 1
        end

        res
    end
    
    def my_join(sep = "")
        res = ""
        count = 0
        while count < self.length
            if count != self.length - 1
                res << self[count] + sep
            else
                res << self[count]
            end
            count += 1
        end
        res
    end

    def my_reverse
        count = self.length - 1
        res = []
        while count >= 0
            res << self[count]
            count -= 1
        end
    
        res
    end
    
end
def factors(num)
    res = []
    (1..num).each do |idx|
        res << idx if num % idx == 0
    end
    
    res 
end
#p factors(20)

def substrings(string)
    res = []
    
    (0...string.length).each do |i1|
        str = ""
        (i1...string.length).each do |i2|
            #res << string[i1..i2]
            str += string[i2]
            res << str
        end
    end
    res
end
#substrings("catching") => ["c", "ca", "cat", "a", "at", "t"]`.


# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def subwords(word, dictionary)
    res = []
    substrings(word).each do |ele|
        res << ele if dictionary.include?(ele)
    end
    res
end

#p subwords("racecar", ["ace","car"])

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
    res = []
    array.each do |ele|
        res << ele * 2
    end
    res
end

p doubler([1,2,3,4,5])

arr = Array.new(3) { []}
arr[0] << "Foo"
p arr