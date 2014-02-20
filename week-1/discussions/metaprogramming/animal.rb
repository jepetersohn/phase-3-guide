class Animal
  def initialize attrs
    create_methods attrs
  end

  def create_methods attrs
    attrs.each do |key, value|
      self.class.send(:define_method, key) do
        value
      end
    end
  end

  define_method :say_hello do
    "hello, my name is #{self.name}"
  end
end


lion = Animal.new :name => "Mr. Lion", :speaks => "roar", :walks => "on 4 legs"
puts lion.speaks
# lion.speaks
puts lion.say_hello

puts lion.methods.inspect
