require_relative "passenger"
require "byebug"
class Flight
    
    attr_accessor :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end 

    def full?
        if @passengers.length == @capacity
            return true
        else
            return false
        end 
    end 

    # rspec is giving us a passenger instance, so we just accept it 

    def board_passenger(name)
        if !self.full? && name.has_flight?(@flight_number)
            @passengers << name
        end 
    end

    # this little fucker game me a hard time, you can access the passenger methods 
    # because you are in a passenger instance 
    def list_passengers
        @passengers.map do |ele|
            ele.name
        end
    end 

    def [](num)
        @passengers[num]
    end 

    def <<(passenger)
        board_passenger(passenger)
    end 

end 