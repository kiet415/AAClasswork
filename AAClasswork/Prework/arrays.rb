#Arrays

letters = ["a","b"]
length = letters.length
index = letters[0]
puts letters #a , new line then b
print letters #["a","b"]

#Shovel operation where you add to end of array
letters << "c"  #letters is now ["a","b","c"]

#array.push
#array.pop
#array.unshift
#array.shift   ALL SAME AS JS

#array/string.index(ele) - elavluate to index where ele is found
#array/string.include?(ele) - boolean to indicate if ele is found
#array/string.reverse new reverse version
#array/string.reverse! reverses array in place
#array/string slicing - can use negative indices. Last idx = -1.. 2nd to last is -2
#   array[startIdx..endIdx] grabs elements from start to end (including element at end)
#   array[startIdx...endIdx] grabs element from start to end (excluding element at end)
#string.split
#array.join

#str.upcase and str.downcase

#Array-Giving Enumerables
#   map
#   select
puts
#Map function
arr = ["a","b","c","d"]

new_arr = arr.map { |ele| ele.upcase }  #["A","B","C","D"]
print new_arr

#Select Function
nums = [1,2,3,4,5,6]
evens = nums.select {|ele| ele % 2 == 0 } #write an expression thats a boolean
print evens #[2,4,6]