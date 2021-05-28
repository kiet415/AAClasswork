class Flight 
    attr_accessor :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        return true if @passengers.length == @capacity
        return false
    end

    def board_passenger(pass)
        if !full? 
            if pass.has_flight?(@flight_number)
                @passengers << pass
            end
        end
    end

    def list_passengers
        names = []
        @passengers.each do |ele|
            names << ele.name
        end
        names
    end
    def [](idx)
        @passengers[idx]
    end
    def <<(pass)
        board_passenger(pass)
    end
end