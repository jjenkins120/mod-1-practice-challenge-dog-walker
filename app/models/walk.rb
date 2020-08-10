class Walk

    attr_reader :length_in_minutes, :dog_instance, :dog_walker_instance

    @@all = []

    def initialize (length_in_minutes, dog_instance, dog_walker_instance)
        @length_in_minutes = length_in_minutes
        @dog_instance = dog_instance
        @dog_walker_instance = dog_walker_instance
        @@all << self
    end

    def self.all
        @@all
    end

    def happy_walker
      walk_instance_array = Walk.all.select do |walk_instance|
        walk_instance == self
      end
      walk_instance_array.each do |walk_instance|
        if walk_instance.dog_instance.breed == walk_instance.dog_walker_instance.favorite_breed
          return true
        else
          return false
        end
      end 
    end

    def print_details
      puts "#{dog_walker_instance.name} walked #{dog_instance.name} for #{length_in_minutes} minutes."
    end

end

=begin
X- `Walk#initialize(length_in_minutes, dog, dog_walker)`
  - should initialize with a length_in_minutes (integer), dog (`Dog` instance) and dog_walker (`DogWalker` instance)
X- `Walk#length_in_minutes`
  - should return the length of the walk in minutes. _Should not_ be able to change after initialization.
X- `Walk.all`
  - Returns an array of all Walk instances

X- `Walk#dog`
  - should return the `Dog` instance for this Walk.
X- `Walk#dog_walker`
  - should return the `DogWalker` instance for this Walk.

X- `Walk#happy_walker?`
  - should return true if the favorite_breed of the dog walker for this walk matches the breed of the dog for this walk, and false if it doesn't match
X- `Walk#print_details`
  - should `puts` to the terminal a string representing this walk
  - the string should be formatted like this: `{dog walker name} walked {dog name} for {length} minutes`
=end