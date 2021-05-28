class Bootcamp
    def initialize(name,slogan,student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|k,v| k[v] = []}
    end
    def name
        @name
    end
    def slogan
        @slogan
    end
    def teachers
        @teachers
    end
    def students
        @students
    end
    def hire(teacher)
        @teachers << teacher
    end
    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            return false
        end
    end
    def enrolled?(student)
        return true if @students.include?(student)
        return false
    end
    def student_to_teacher_ratio
        return (@students.length / @teachers.length).floor 
    end
    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student] << grade
            return true
        end
        return false
    end
    def num_grades(student)
        return @grades[student].length
    end

    def average_grade(student)
        return nil if !@students.include?(student) || @grades[student].length == 0
        sum = 0
        arr = @grades[student]
        arr.each {|ele| sum += ele}

        return (sum/arr.length).floor

    end
end
