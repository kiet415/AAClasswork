require_relative 'MyStack.rb'

class StackQueue < MyStack 
    def initialize
        super()
    end

    def peek 
        p self.store 
    end

end

