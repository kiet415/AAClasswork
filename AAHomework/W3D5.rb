# EXERCISE 1 - STACK
class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack << el
        el
    end

    def pop
        @stack.pop
    end

    def peek
        @stack.last
    end

end

#EXERCISE 2 - QUEUE
class Queue 
    def initialize
        @queue = []
    end
    
    def enqueue(el)
        @queue << el
        el 
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end

end

#EXERCISE 3 - MAP
class Map
    def initialize
        @map = []
    end
    def set(key,value)
        if @map.none? {|ele| ele[0] == key}
            @map << [key,value]
        else
            @map.each_with_index do |ele,idx|
                ele[1] == val if ele[0] == key
            end
        end
    end
    def get(key)
        @map.each do |ele|  #[k,v]
            return ele[1] if ele[0] == key
        end
    end

    def delete(key)
        @map.each_with_index do |ele,idx|
            @map.delete_at(idx) if ele[0] == key
        end
    end
    
    def show
        map1 = []
        @map.each do |ele|
            map1 << ele
        end
        map1
    end

end