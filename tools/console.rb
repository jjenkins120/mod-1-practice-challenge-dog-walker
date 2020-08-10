# require and load the environment file
require_relative '../config/environment.rb'

# call this method to reload your models as you write code
def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

dw1 = DogWalker.new("Shavon", "Shiba Inu")
dw2 = DogWalker.new("Taryn", "Poodle")
dw3 = DogWalker.new("Mimi", "St. Bernard")

d1 = Dog.new("Akita", "Shiba Inu", false)
d2 = Dog.new("Rex", "Pitbull", false)
d3 = Dog.new("Fancy", "Poodle", true)
d4 = Dog.new("Fido", "Golden Retriever", true)

w1 = Walk.new(90, d2, dw1)
w2 = Walk.new(30, d3, dw2)
w3 = Walk.new(120, d4, dw3)
w4 = Walk.new(60, d1, dw3)
w5 = Walk.new(90, d1, dw1)


# ===== WARNING! DO NOT EDIT BELOW THIS LINE ===== #
binding.pry
0
