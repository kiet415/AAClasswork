#Day 1 

#Common Enumerables
#all? - Return true when all elements result in true when passed into block

p [2,4,6].all? { |el| el.even?} #true
p [2,3,6].all? { |el| el.even?} #false

#any? - Return true when all at least one element results in true when passed into block
p [3,4,7].any? { |el| el.even?} #true
p [3,5,7].any? { |el| el.even?} #false

#none? - Return true when no elements in tre when passed into block.
p [1, 3, 5].none? { |el| el.even? } # => true
p [1, 4, 5].none? { |el| el.even? } # => false

#one? - Return true when exactly one elements in true when passed into block
#count - Return a number representing the count of elements that result in true when passed into the block.
p [1, 2, 3, 4, 5, 6].count { |el| el.even? }    # => 3

#sum - Return total sum of all elements
p [1, -3, 5].sum   # => 3

#max/min - Return max or min element
#flatten - Return 1 dimensional version of any multidimensional array
multi_d = [
    [["a", "b"], "c"],
    [["d"], ["e"]],
    "f"
]
p multi_d.flatten   # => ["a", "b", "c", "d", "e", "f"]

#Symbols
#In Ruby we denote symbols using a colon (:) before writing characters.
sym = :hello
#Symbols are immutable, so you cant change a symbol. Using symbols allow faster and efficient look up times than strings.
#Using symbols in hash keys are good
my_bootcamp = { :name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"] } 
my_bootcamp = { name:"App Academy", color:"red", locations:["NY", "SF", "ONLINE"] } # or do this as faster
p my_bootcamp[:color]

#Default arguments
def repeat(msg, num=1)
    msg * num
end
p repeat("hi") # => "hi"
p repeat("hi", 3) # => "hihihi"

#Splat Operator (*)
#This is for if you wanna take in potentially more arguments
def method(arg1, arg2, *others)
    p arg1
    p arg2
    p others
end

method("a","b","c","d","e")

#Using Splat to decompose array/hash ///// Use double ** if you use for hash(keys must be symbols though)
def greet(first_name, last_name)
    p "Hey " + first_name + ", your last name is " + last_name
end

names = ["Grace", "Hopper"]
greet(*names)    # => "Hey Grace, your last name is Hopper"

p newNames = [*names , "Kiet" , "Nguyen"]

#Inject - Known as reduce in other programming languages
#Takes an accumulator and the current element.
[11, 7, 2, 4].inject { |acc, el| acc + el }  #=> 24
#We can also have an inital accumulator
[11, 7, 2, 4].inject(100) { |acc, el| acc + el } #=> 124
[11, 7, 2, 4].inject(0) do |acc, el|
    if el.even?
        acc + el
    else
        acc
    end
end # => 6

#Global variables - Creating a global variable uses a $ at the beginning of the name
$msg = "hello"
#Constant variables - Uses a capital letter of beginning of name. You cant reassign the constant but you can mutate it still.
Food = "pho"

#Swapping variables
food = "mom's spaghetti"
clothing = "sweater"
food, clothing = clothing, food

#Exceptions - using begin...rescue
num = 0

begin
  puts "dividing 10 by #{num}"
  ans = 10 / num
  puts "the answer is #{ans}"
rescue
  puts "There was an error with that division."
end

puts "--------"
puts "finished"