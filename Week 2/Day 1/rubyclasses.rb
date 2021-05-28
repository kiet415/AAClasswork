#Instance variable is @
#Class Variable is @@

class Cat
    def initialize(name, color, age)
        @name = name
        @color = color
        @age = age

    end

    def name
        @name
    end
    def age
        @age
    end
    def age=(new_age)
        @age = new_age
    end
    def meow_at(person)
        puts "#{name} meows at #{person}"
    end
end

cat = Cat.new("Kitty", "Grey", 12)
p cat
p cat.age
cat.age = 15
p cat.age
cat.meow_at("Kiet")

class Car
    @@num_wheels = 4
    def initialize(color)
        @color = color
    end

    def self.upgrade
        @@num_wheels = 0
    end

    def num_wheels
        @@num_wheels
    end
end

car1 = Car.new("black")
car2 = Car.new("red")

p car1.num_wheels
p car2.num_wheels

Car.upgrade

p car1.num_wheels

car3 = Car.new("silver")
p car3.num_wheels