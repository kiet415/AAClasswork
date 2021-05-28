#We can use the spaceship operator <=> to relatively compare two values. 
#The spaceship operator <=> is used between two values and will 
#return -1, 0, or 1. The behavior is as follows:

#given the expression a <=> b
#it will return -1 if a is less than b
#it will return 0 if a is equal to b
#it will return 1 if a is greater than b

7 <=> 2     # => 1
7 <=> 7     # => 0
2 <=> 7     # => -1
10 <=> 2    # => 1
-5 <=> 10   # => -1
-3 <=> -9   # => 1