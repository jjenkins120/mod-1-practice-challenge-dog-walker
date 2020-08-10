class Dog
  attr_reader :name, :breed
  attr_accessor :good_dog

  @@all = []

  def initialize(name, breed, good_dog)
    @name = name
    @breed = breed
    @good_dog = good_dog

    @@all << self
  end

  def self.all
    @@all
  end

  def walks
    Walk.all.select do |walk_instance|
      walk_instance.dog_instance == self
    end
  end
  
  def dog_walkers
    walk_instance_array = Walk.all.select do |walk_instance|
      walk_instance.dog_instance == self
    end
    dog_walker_array = walk_instance_array.map do |walk_instance|
      walk_instance.dog_walker_instance.name
    end
    dog_walker_array.uniq
  end

  def take_walk(length_in_minutes, dog_walker)
    Walk.new(length_in_minutes, self, dog_walker)
  end

  def print_walk_details
    walk_instance_array = Walk.all.select do |walk_instance|
      walk_instance.dog_instance == self
    end
    walk_instance_array.each do |walk_instance|
      puts "#{walk_instance.dog_walker_instance.name} walked #{walk_instance.dog_instance.name} for #{walk_instance.length_in_minutes} minutes."
    end
  end

  def self.good_dogs
    Dog.all.select do |dog_instance|
      dog_instance.good_dog == true
    end
  end

end

=begin

X- `Dog#initialize(name, breed, good_dog)`
  - should initialize with a name (string), a breed (string), and whether or not this dog is a good dog (boolean)
X- `Dog#name`
  - should return the name of the dog. _Should not_ be able to change after initialization.
X- `Dog#breed`
  - should return the breed of the dog. _Should not_ be able to change after initialization.
X- `Dog#good_dog`
  - should return the dog's good dog status. _Should_ be able to change after initialization.
X- `Dog.all`
  - Returns an array of all Dog instances

X- `Dog#walks`
  - returns an array of all the walks that the Dog has taken
X- `Dog#dog_walkers`
  - returns a **unique** array of all the dog walkers that the Dog received walks from

X- `Dog#take_walk(length_in_minutes, dog_walker)`
  - takes a `dog_walker` (an instance of the `DogWalker` class) and an `length_in_minutes` (integer) as arguments, and creates a new `Walk` instance associated with this dog and the given dog walker
X- `Dog#print_walk_details`
  - should `puts` to the terminal a string for each of the dog's walks
  - each string should be formatted like this: `{dog walker name} walked {dog name} for {length} minutes`
X- `Dog.good_dogs`
  - returns an array of all dog instances whose are good dogs
=end