def all_words_capitalized?(arr)
    arr.all? {|ele| ele == ele.capitalize}
end

def no_valid_url?(arr)
    sites = [".com",".net", ".io", ".org"]
    arr.none? do |ele| 
        sites.any? {|el| ele.include?(el)}
    end
end

def any_passing_students?(arr)
    arr.any? do |ele|
        ele[:grades].sum / ele[:grades].length >= 75
    end
end