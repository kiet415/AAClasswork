#attr_reader
class Dog
    # attr_reader will define #name and #age getters for us
    attr_reader :name, :age
    #In a similar way, we can use attr_writer to define setter methods:
    attr_writer :name, :age

    #attr_accessor
    #Often times we may want to both a getter and setter for an attribute.   
    attr_accessor :name, :age
    def initialize(name, age, favorite_food)
      @name = name
      @age = age
      @favorite_food = favorite_food
    end
end

#In a similar way, we can use attr_writer to define setter methods:
