class Greeting
  def initialize text
    @text = text
  end

  def welcome
    @text
  end
end

my_object = Greeting.new "Hello"

puts my_object.welcome
puts
puts my_object.class
puts
puts my_object.class.instance_methods false
puts
puts my_object.instance_variables
