require "employee"

class Startup
    attr_accessor :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries

        @employees = []
    end

    def valid_title?(title)
        return true if @salaries[title]
        return false
    end
    def >(other)
        return true if self.funding > other.funding
        return false
    end
    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name,title)
        else
            raise "title is invalid"  
        end
    end
    def size
        @employees.length
    end
    def pay_employee(employ)
        if self.funding >= @salaries[employ.title]
            employ.pay(@salaries[employ.title])
            @funding -= @salaries[employ.title]
        else 
            raise 'not enough funding'
        end
    end
    def payday
        @employees.each {|ele| pay_employee(ele)}
    end
    def average_salary
        sum = 0
        @employees.each do |ele|
            sum += @salaries[ele.title]
        end
        sum / @salaries.length
    end
    def close 
        @employees = []
        @funding = 0
    end
    def acquire(other)
        @funding += other.funding
        other.salaries.each do |k,v|
            @salaries[k] = v if !@salaries[k]
        end
        @employees += other.employees
        other.close
    end

end
