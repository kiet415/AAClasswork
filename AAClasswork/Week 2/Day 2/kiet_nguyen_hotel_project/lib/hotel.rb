require_relative "room"

class Hotel
  def initialize(name, capacities)
    @name = name
    @rooms = {}
    capacities.each do |k,v|
        @rooms[k] = Room.new(v)
    end
  end

  def name
    res = @name.split(" ")
    res.each_with_index {|ele,i| res[i] = ele.capitalize}
    res.join(" ")
  end
  def rooms
    @rooms
  end
  def room_exists?(name)
    return true if @rooms[name]
    return false
  end
  def check_in(person,room_name)
    if !self.room_exists?(room_name)
        p 'sorry, room does not exist'
    else
        if @rooms[room_name].add_occupant(person)
            p 'check in successful'
        else
            p 'sorry, room is full'
        end
    end
  end
  def has_vacancy?
    return true if @rooms.values.any? {|room| room.available_space > 0 }
    return false
  end
  def list_rooms
    @rooms.each do |k,v|
        puts "#{k} : #{v.available_space}"
    end
  end
end
