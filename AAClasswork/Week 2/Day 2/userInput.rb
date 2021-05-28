#Build in method we'll use to allow user to give input is "gets"
#When used, it'll halt execution of the code and allows user to type
#characters until they press enter.
#Once enter is hit, the "gets" method will return a str of the user

p "Enter your name:"
name = gets
p "hello " + name #returns hello Kiet\n

#Chomping New Lines
#To fix issue from prev code, we use "chomp" to remove all new line chars "\n"

my_string = "yes\n"
p my_string       # "yes\n"

p my_string.chomp # "yes"

#Abstraction
#In OOP, abstraction is the process of exposing essential features 
#of an object while hiding inner details that are not necessary to using the feature.

#Encapsulation
#Similar to abstraction, encapsulation closely relates methods and data attributes 
#together with the hope of preventing misuse

