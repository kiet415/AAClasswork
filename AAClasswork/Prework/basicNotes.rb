puts "Hello World" #Printing in Ruby
puts 1 + 1 #2
puts -5 + 3 #-2
puts 5 / 2 #2  (stays as an int)
puts 5 / 2.0 #2.5  DOES PEMDAS 

#Ruby comparisons
#==, !=, >, <, >=, <= 

#Boolean data type
#! , && , ||

puts true && true

#We have been using puts frequently in this course, but you can also use print and p

#Use \n for new line
#use \t for white space like tab
print "\thello\n"  #   world

#p prints data to the screen with a new line but also gives information on type of data was printed:
p "hello" #"hello"

#String Operations Lecture
#.length does same as JS
puts "Hello world".length #11

#indexing same as JS
puts "Hello"[0] #H

#can concatenate strings as well
puts "Hello " + "world" #Hello world


#Variables
location = "SF"
puts location #SF

num = 42
puts num + 8 #50
num -= 5 #45

#Methods
#Defining a method

def sayMessage(person)
    puts "Hello " + person + "."
    
end

def average(num1, num2) 
    return (num1 + num2) / 2.0
end
#Call method
sayMessage("Kiet") #Hello Kiet.
result = average(20,5)
puts result #12.5

#Conditional 
num = 0
if num > 0
    puts "positive"
elsif num < 0
    puts "negative"
else 
    puts "0"
end