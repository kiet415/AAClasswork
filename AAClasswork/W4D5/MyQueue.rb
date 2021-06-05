class MyQueue
    def initialize()
        @store = []
    end

    def enqueue
        @store.push
    end

    def dequeue
        @store.shift 
    end

    def peek 
        @store.last 
    end

    def size 
        @store.length 
    end

    def empty?
        @store.length == 0
    end
end