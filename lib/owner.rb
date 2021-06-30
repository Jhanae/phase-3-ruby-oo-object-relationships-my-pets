class Owner
  # code goes here
  attr_reader  :name, :species, :say_species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @say_species = "I am a human."
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner === self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner === self }
  end

  def buy_cat(name)
    Cat.new(name,self)
    # self.count += 1
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    # [dogs,cats].each {|pet| pet.mood = "nervous"}
    pets = self.dogs + self.cats
    pets.each {|pet| pet.mood = "nervous"}
    pets.each {|pet| pet.owner = nil}
    # OR
    # pets.each do |pet| 
    # pet.mood = "nervous"
    # pet.owner = nil
    # end
  end

  def list_pets
    # pets = self.dogs + self.cats
    # pets.each do |pet| 
    #   return pet
    # end
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end