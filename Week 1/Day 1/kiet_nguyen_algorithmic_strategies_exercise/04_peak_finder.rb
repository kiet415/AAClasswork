# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
    ctr = 0
    res = []
    while(ctr < arr.length)
        if (ctr == 0) && (arr[ctr] > arr[ctr+1])  
            res << arr[ctr]
        elsif (ctr == arr.length-1) && (arr[ctr] > arr[ctr-1])
            res << arr[ctr]
        elsif (ctr != 0 && ctr != arr.length-1 && arr[ctr] > arr[ctr+1]) && (arr[ctr] > arr[ctr-1])
            res << arr[ctr]
        end
    
        ctr+=1
    end
    res
end
p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
