class Customer
  attr_reader :name, :age


  # class variables
  @@all = []

  # class methods
  def self.all
    @@all
  end


  # instance methods
  def initialize(name, age)
    @@all << self

    @name = name
    @age = age
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.customer == self}
  end

  def waiters
    meals.collect {|meal| meal.waiter}
  end

end
