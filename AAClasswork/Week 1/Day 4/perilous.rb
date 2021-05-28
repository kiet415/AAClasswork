p "SOME?"
def some?(arr, &prc)

    arr.each do |ele|
        return true if prc.call(ele)
    end
    return false
end

p some?([3, 1, 11, 5]) { |n| n.even? }                                # false
p some?([3, 4, 11, 5]) { |n| n.even? }                                # true
p some?([8, 2]) { |n| n.even? }                                       # true
p some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } # false
p some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } # true
p some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }        # true

p "EXACTLY?"
def exactly?(arr,n, &prc)
    ctr = 0
    arr.each {|ele| ctr+=1 if prc.call(ele)}
    return true if ctr == n
    return false  
end

p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
p exactly?([4, 5], 3) { |n| n > 0 }                             # false
p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true

p "FILTER_OUT"
def filter_out(arr, &prc)
    res = []
    arr.each {|ele| res << ele if !prc.call(ele)}
    res
end
p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
p filter_out([1, 7, 3, 5 ]) { |x| x.even? }         # [1, 7, 3, 5]

p"AT_LEAST?"

def at_least?(arr, n, &prc)
    res = 0
    arr.each {|ele| res+=1 if prc.call(ele)}
    return true if res >= n
    return false
end

p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') } # false
p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') } # false
p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') } # true
p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') } # true
p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') } # true
p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') } # false
p at_least?([false, false, false], 3) { |bool| bool } # false
p at_least?([false, true, true], 3) { |bool| bool } # false
p at_least?([true, true, true], 3) { |bool| bool } # true
p at_least?([true, true, true, true], 3) { |bool| bool } # true

p "EVERY?"

def every?(arr, &prc)
    arr.each {|ele| return false if !prc.call(ele)}
    return true
end

p every?([3, 1, 11, 5]) { |n| n.even? }                                 # false
p every?([2, 4, 4, 8]) { |n| n.even? }                                  # true
p every?([8, 2]) { |n| n.even? }                                        # true
p every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }  # false
p every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }   # false
p every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }          # true

p "AT_MOST?"

def at_most?(arr,n, &prc)
    res = 0
    arr.each {|ele| res+=1 if prc.call(ele)}
    return true if res <= n
    return false
end

p at_most?([-4, 100, -3], 1) { |el| el > 0 }                         # true
p at_most?([-4, -100, -3], 1) { |el| el > 0 }                        # true
p at_most?([4, 100, -3], 1) { |el| el > 0 }                          # false
p at_most?([4, 100, 3], 1) { |el| el > 0 }                           # false
p at_most?(['r', 'q', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
p at_most?(['r', 'i', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
p at_most?(['r', 'i', 'e', 'o'], 2) { |el| 'aeiou'.include?(el) }    # false

p "FIRST_INDEX"

def first_index(arr, &prc)
    arr.each_with_index {|ele, i| return i if prc.call(ele)}

    return nil
end

p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }           # 2
p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } # 0
p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 } # nil
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }            # 0
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }        # 1
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }            # nil

p "xnor_select"
def xnor_select(arr, prc1, prc2)
    res = []
    arr.each do |ele|
        res << ele if prc1.call(ele) && prc2.call(ele)
        res << ele if !prc1.call(ele) && !prc2.call(ele)
    end
    res
end

is_even = Proc.new { |n| n % 2 == 0 }
is_odd = Proc.new { |n| n % 2 != 0 }
is_positive = Proc.new { |n| n > 0 }
p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]

p "FILTER_OUT! didnt finish"
def filter_out!(arr, &prc)
    arr.each_with_index do |ele, i|
        if prc.call(ele)
            arr = arr.slice(0,i)+ (arr.slice(i+1,arr.length))
            i-=1
        end
    end
    arr
end

arr_1 = [10, 6, 3, 2, 5 ]
filter_out!(arr_1) { |x| x.odd? }
p arr_1     # [10, 6, 2]

arr_2 = [1, 7, 3, 5 ]
filter_out!(arr_2) { |x| x.odd? }
p arr_2     # []

arr_3 = [10, 6, 3, 2, 5 ]
filter_out!(arr_3) { |x| x.even? }
p arr_3     # [3, 5]

arr_4 = [1, 7, 3, 5 ]
filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
p arr_4 # [1, 7, 3, 5]

p "MULTI_MAP"
def multi_map(arr,n=1,&prc)
    res = []
        arr.each do |ele|
            ctr = 0
            temp = ele
            while ctr < n
                ele = prc.call(ele)
                ctr+=1
            end
            res << ele
        end
    res
end

p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]

p "PROCTITION"
def proctition(arr, &prc)
    #res = []
    trues = []
    falses = []
    arr.each do |ele|
        trues <<  ele if prc.call(ele)
        falses << ele if !prc.call(ele)
    end
    return trues.concat(falses)
end

p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }
# [4, 7, 1, 3, -5, -10, -2]

p proctition([7, 8, 3, 6, 10]) { |el| el.even? }
# [8, 6, 10, 7, 3]

p proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }
# ["boot", "bug", "boat", "cat", "dog"]

p"SELECTED_MAP!"
def selected_map!(arr, prc1, prc2)
    arr.each_with_index do |ele,i| 
        arr[i] = prc2.call(ele) if prc1.call(ele)
    
    end
    return nil
end

is_even = Proc.new { |n| n.even? }
is_positive = Proc.new { |n| n > 0 }
square = Proc.new { |n| n * n }
flip_sign = Proc.new { |n| -n }

arr_1 = [8, 5, 10, 4]
p selected_map!(arr_1, is_even, square)     # nil
p arr_1                                     # [64, 5, 100, 16]

arr_2 = [-10, 4, 7, 6, -2, -9]
p selected_map!(arr_2, is_even, flip_sign)  # nil
p arr_2                                     # [10, -4, 7, -6, 2, -9]

arr_3 = [-10, 4, 7, 6, -2, -9]
p selected_map!(arr_3, is_positive, square) # nil
p arr_3                                     # [-10, 16, 49, 36, -2, -9]

p "CHAIN_MAP"
def chain_map(num, arr) 
    arr.each do |ele|
        num = ele.call(num)
    end
    num
end

add_5 = Proc.new { |n| n + 5 }
half = Proc.new { |n| n / 2.0 }
square = Proc.new { |n| n * n }

p chain_map(25, [add_5, half])          # 15.0
p chain_map(25, [half, add_5])          # 17.5
p chain_map(25, [add_5, half, square])  # 225
p chain_map(4, [square, half])          # 8
p chain_map(4, [half, square])          # 4

p "PROC_SUFFIX"
def proc_suffix(str, hash)
    words = str.split(" ")
    res = []
    words.each do |ele|
        temp = ele
        hash.each do |k,v|
            temp += v if k.call(ele)
        end
        res << temp
    end
    res.join(" ")
end

contains_a = Proc.new { |w| w.include?('a') }
three_letters = Proc.new { |w| w.length == 3 }
four_letters = Proc.new { |w| w.length == 4 }

p proc_suffix('dog cat',
    contains_a => 'ly',
    three_letters => 'o'
)   # "dogo catlyo"

p proc_suffix('dog cat',
    three_letters => 'o',
    contains_a => 'ly'
)   # "dogo catoly"

p proc_suffix('wrong glad cat',
    contains_a => 'ly',
    three_letters => 'o',
    four_letters => 'ing'
)   # "wrong gladlying catlyo"

p proc_suffix('food glad rant dog cat',
    four_letters => 'ing',
    contains_a => 'ly',
    three_letters => 'o'
)   # "fooding gladingly rantingly dogo catlyo"

p"PROCTITION_PLATINUM"
def proctition_platinum(arr, *prc)
    hash = {}

    hash
end