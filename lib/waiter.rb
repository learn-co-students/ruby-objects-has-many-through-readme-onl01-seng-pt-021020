class Waiter
  attr_reader :name, :yrs_service
  
  
  # class variables
  @@all = []
  
  # class methods
  def self.all
    @@all
  end
  
  
  # instance methods
  def initialize(name, yrs_service)
    @@all << self
    
    @name = name
    @yrs_service = yrs_service
  end
  
  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end
  
  def best_tipper
    meals.sort {|a, b| a.tip <=> b.tip}.last.customer
  end
  
end