#Hashes, just like maps
#`key => value` pairs
#Two ways to make a hash
my_hash = Hash.new("this is default")  #Will output as {} but if you put something in itll be default as 0
puts my_hash["a"]  #"this is default"
hash = {
    "name" => "App Academy", 
    "color" => "red", 
    "age" => 5,
    42 => "hello"
}
puts hash  #{"name"=>"App Academy", "color"=>"red", "age"=>5}
puts hash["name"] #App Academy
puts hash[42]

#Hash Methods
#.length
#.has_key?(k)  - boolean to check if it has the key or not
#.has_value?(v) - boolean to check if it has value or not
#.keys gets array of all the keys
#.values gets array of all the values

#Iterating Hashes

hash.each do |k, v|
    puts "---"
    puts k
    puts v
end

hash.each_key do |k|
    puts k
end
hash.each_value do |v|
    puts v
end

#Frequency hash
newHash = Hash.new(0)
string = "Kiet Nguyen is awesome"
string.each_char {|char| newHash[char] += 1}
puts newHash


#Sort by key or vaule
print newHash.sort_by {|k,v| v}  #sorted in increasing order by values