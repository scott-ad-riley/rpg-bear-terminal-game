# This file is not part of the code or project it just illustrates how inheritance works
# First off, a parent has no idea about a child, it's behaves as if it doesn't exist
# calling a method "super" inside of a class that inherits from another class, will call
# that same method it is inside, in the parent (with the arguments you pass to it)
# so in this case, in the child, it calls the initialize() method from the parent.
# It's important to realise that you still have a object of the child class, so despite
# the names I gave them, @parent_var_one and @parent_var_two are actually instance variables
# for your Child class and all behaviours/methods inside of Parent are carried down into (but
# can be overwritten by) Child.

class Parent
	attr_reader :parent_var_one, :parent_var_two
	def initialize(argument)
		@parent_var_one = argument
		@parent_var_two = "banana"
	end
end

class Child < Parent
	attr_reader :child_var
	def initialize(argument)
		super("tomato")
		@child_var = argument
	end
end


foo = Parent.new("apple")
puts foo.parent_var_one # => "apple"
puts foo.parent_var_two # => "banana"

bar = Child.new("orange")
puts bar.child_var # => "orange"
puts bar.parent_var_one # => "tomato"
puts bar.parent_var_two # => "banana"