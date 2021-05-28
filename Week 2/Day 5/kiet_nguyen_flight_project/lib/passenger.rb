class Passenger
    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(num)
        return true if @flight_numbers.include?(num.upcase)
        return false
    end

    def add_flight(num)
        if !has_flight?(num)
            @flight_numbers << num.upcase 
        end 
    end
end