#Test Driven Development
#Automated testing with a Ruby library - RSpec
#Seperate implementation code files from testing files using /lib and /spec folder respectively. 
#Another word for "test" is "spec" (specification).
#/example_project
#  ├── lib
#  │   ├── add.rb
#  │   └── prime.rb
#  └── spec
#      ├── add_spec.rb
#      └── prime_spec.rb
# To reiterate, our goal right now is to read RSpec, not necessarily write it.
#describe - names the method being tested
#it - expresses the expected behavior of the method being tested
#expect - shows how that behavior is tested

#Debugging using PRY
#REPL stands for Read Evaluate Print Loop

#Byebug for debugging as well
#Before running file "require "byebug"" to top of file
#"debugger" - place that at line where you want to begin debugger mode

#Procs - is an object that contains a block because they allow us to save blocks to variables so we can manipulate them in our code
#Think of a proc as a wrapper around a block.
doubler = Proc.new {|num| num * 2}
#Now we call by doing
p doubler.call(5)

def add_and_proc(num_1, num_2, prc)
    sum = num_1 + num_2
    p prc.call(sum)
  end
  
square = Proc.new { |num| num * num }
add_and_proc(3, 6, square)    # => 81

# Version 2: automatic conversion from block to proc
def add_and_proc(num_1, num_2, &prc)
    sum = num_1 + num_2
    p prc.call(sum)
end
  
add_and_proc(1, 4) { |num| num * 2 }