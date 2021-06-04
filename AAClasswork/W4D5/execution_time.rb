def my_min(array)
    min = array[0]
    (0...array.length).each do |i1|
        if array.all?{ |i2| array[i1]<=i2}
            return array[i1]
        end 
    end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

def largest_contiguous_subsum(array)
    max = -999999
end