class Room
    attr_accessor :capacity, :occupants
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end
    def full?
        return false if @occupants.length < @capacity
        return true
    end
    def available_space
        return @capacity - @occupants.length
    end
    def add_occupant(name)
        if !self.full?
            @occupants << name
            return true
        end
        return false
    end
end
