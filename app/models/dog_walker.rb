class DogWalker
  
  attr_reader :name
  attr_accessor :favorite_breed

  @@all = []

  def initialize(name, favorite_breed)
    @name = name
    @favorite_breed = favorite_breed

    @@all << self
  end

  def self.all
    @@all
  end

  def walks
    Walk.all.select do |walk_instance|
      walk_instance.dog_walker_instance == self
    end
  end

  def dogs
    walk_instance_array = Walk.all.select do |walk_instance|
      walk_instance.dog_walker_instance == self
    end
    dog_array = walk_instance_array.map do |walk_instance|
      walk_instance.dog_instance.name
    end
    dog_array.uniq
  end

  def give_walk(length_in_minutes, dog)
    Walk.new(length_in_minutes, dog, self)
  end

  def length_of_all_walks
    walk_instance_array = Walk.all.select do |walk_instance|
      walk_instance.dog_walker_instance == self
    end
    length_array = walk_instance_array.map do |walk_instance|
      walk_instance.length_in_minutes
    end
    length_array.sum
  end

  def self.most_walks
    dog_walker_instance_array = Walk.all.map do |walk_instance|
      walk_instance.dog_walker_instance
    end
    counting_hash = {}
    dog_walker_instance_array.each do |dog_walker_instance|
      if counting_hash[dog_walker_instance] == nil
        counting_hash[dog_walker_instance] = 1
      else 
        counting_hash[dog_walker_instance] += 1
      end
    end
    counting_hash.max_by do |k,v|
      v 
      return k
    end
  end

end

=begin

X- `DogWalker#initialize(name, favorite_breed)`
  - should initialize with a name (string) and favorite_breed (string)
X- `DogWalker#name`
  - should return the name of the dog walker. _Should not_ be able to change after initialization.
X- `DogWalker#favorite_breed`
  - should return the favorite breed of the dog walker. _Should_ be able to change after initialization.
X- `DogWalker.all`
  - Returns an array of all DogWalker instances

X- `DogWalker#walks`
  - returns an array of all the walks given by the DogWalker
X- `DogWalker#dogs`
  - returns a **unique** array of all the dogs who have been walked by the DogWalker

X- `DogWalker#give_walk(length_in_minutes, dog)`
  - takes a `dog` (an instance of the `Dog` class) and an `length_in_minutes` (integer) as arguments, and creates a new `Walk` instance associated with this dog walker and the given dog
X- `DogWalker#length_of_all_walks`
  - returns an integer for the total length of all walks this dog walker has given
X- `DogWalker.most_walks`
  - should return an instance of `DogWalker` which has given the most walks
=end