class MyStack
    def initialize()
        @store = []
    end

    def push
        @store.push
    end

    def pop 
        @store.pop
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