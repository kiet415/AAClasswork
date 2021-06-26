# Problem 1:
# Given a pattern and a string str, determine if str follows the same pattern.
# Example 1
# Input: pattern = "abba", str = "dog cat cat dog"
# Output: true
# Example 2
# Input: pattern = "abba", str = "dog cat cat fish"
# Output: false
# Example 3
# Input: pattern = "aaaa", str = "dog cat cat dog"
# Output: false
# Example 4
# Input: pattern = "abba", str = "dog dog dog dog"
# Output: false
# You may assume pattern contains only lowercase letters, and str contains lowercase letters that may be separated by a single space. Can you solve it in O(N) time and O(1) space?



def pattern_str(pattern, str)
    hash = {}
    hash1 = {}
    arr = str.split(" ") # [dog,cat,cat,dog]

    (0...pattern.length).each do |i|
        if !hash[pattern[i]]  && !hash1[arr[i]]
            hash[pattern[i]]  = arr[i]      #hash[a] = dog
            hash1[arr[i]] = pattern[i]      #hash1[dog] = a
        elsif hash1[arr[i]] != pattern[i]
            return false
        elsif hash[pattern[i]] != arr[i]    
            return false
        end
    end
    return true

end

# pattern = "abba"
# str = "dog cat cat dog"
# p pattern_str(pattern, str)

# pattern = "abba" 
# str = "dog cat cat fish"
# p pattern_str(pattern, str)

# pattern = "aaaa"
# str = "dog cat cat dog"
# p pattern_str(pattern, str)

# pattern = "abba" 
# str = "dog dog dog dog"
# p pattern_str(pattern, str)

# Problem 2:
# Given two strings S and T, return if they are equal when both are typed into empty text editors. In this case, # indicates a backspace character.
# Example 1
# Input: S = "ab#c", T = "ad#c"   loop => store the current string 
# Output: true
# Explanation: Both S and T become "ac".
# Example 2
# Input: S = "ab##", T = "c#d#"
# Output: true
# Explanation: Both S and T become "".
# Example 3
# Input: S = "a##c", T = "#a#c"
# Output: true
# Explanation: Both S and T become "c".
# Example 4
# Input: S = "a#c", T = "b"
# Output: false
# Explanation: S becomes "c" while T becomes "b".
# Note:
# 1. 1 <= S.length <= 200
# 2. 1 <= T.length <= 200
# 3. S and T only contain lowercase letters and '#' characters.
# Can you solve it in O(N) time and O(1) space?

def problem2(str1, str2)
    result1 = ""
    count = 0
    index = str1.length-1
    while index>0
        if str1[index]!='#'
            if count>0
                count-=1
            else
                result1+=str1[index]
            end
        else 
            count+=1
        end
        index-=1
    end

    result2 = ""
    count1 = 0
    index = str2.length-1
    while index>0
        if str2[index]!='#'
            if count1>0
                count1-=1

            else
                result2+=str2[index]

            end
        else 
            count1+=1
        end
        index-=1
    end
    
    # p result1
    # p result2
    result1 == result2
end

S = "ab#c" 
T = "ad#c" 

p problem2(S,T)
# Output: true
# Explanation: Both S and T become "ac".

S = "ab##" 
T = "c#d#"
p problem2(S,T)
# Example 2
# Input: S = "ab##", T = "c#d#"
# Output: true


# Explanation: Both S and T become "".
# Example 3
# Input: S = "a##c", T = "#a#c"
# Output: true
S = "a##c" 
T = "#a#c"
p problem2(S,T)

# Explanation: Both S and T become "c".
# Example 4
# Input: S = "a#c", T = "b"
# Output: false
S = "a#c" 
T = "b"
p problem2(S,T)



arr = [-8,-1,0,3,6]


def square(arr)
    res = []
    l = 0
    r = arr.length-1
    while l <= r 
        if arr[l] * arr[l] >= arr[r] * arr[r]
            res << arr[l] * arr[l]
            l+=1
        else
            res << arr[r] * arr[r]
            r-=1
        end
    end
    res.reverse
end

p square(arr)