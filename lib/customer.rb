class Customer

  attr_accessor :name, :age
  attr_reader

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

# OBJECT RELATIONSHIPS

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  # def meals
  #   Meal.all.new_meal
  # end

  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  # def waiters
  #   Waiter.all.select do |waiter|
  #     waiter.customer == self
  #   end
  # end

  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end
end
