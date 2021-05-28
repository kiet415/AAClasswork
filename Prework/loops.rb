#Loops
def repeatHello()
    counter = 1
    while counter < 5
        puts "hello"
        counter+=1
    end
end
repeatHello()

#break - immediately exit loop
#next - goes to next iteration


#Enumerable Methods   Value inbetween | | is the elements inside the array/str NOT THE CTR
#   array
#       .each
#       .each_with_index  # iterate over elements of an array with index using each_with_index
        #people.each_with_index do |person, i|
#           puts person
#           puts i
#           puts "-----"
#      end # prints
# Candace
# 0
# -----

#   string
#       .each_char
#       .each_char.with_index
months = ["Jan","Feb","Mar","April"]
months.each { |month| puts month }   #Basically like a for(let month in months) in JS This is a single line code tho

#Multi block is
months.each do |month|
    puts month
    puts "hi"
end

#Range enumerable
#   (start..end).each  - from start to end(inclusive)
#   (start...end).each - from start to end (excluding end)
(5..10).each {|num| puts num}