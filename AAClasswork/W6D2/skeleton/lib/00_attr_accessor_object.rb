class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # iterate through method names
    # for each method name, define a method with that name
    # the method being defined should get the instance variable of that same name
    
    names.each do |name|
      define_method(name) do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |val|
        instance_variable_set("@#{name}", val)
      end
    end
  end
end
