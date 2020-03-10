class Waiter
  @@all = []
  attr_accessor :name, :years_exp

  def initialize(name, years_exp)
    @name = name
    @years_exp = years_exp
    @@all << self
  end
  #initializes with a name and years_exp
  #.all is a class method that returns the content of @@all

  def self.all
    @@all
  end
  #returns @@all

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end
  #initializes a meal using the current waiter instances, a provided customer, total, and tip

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end
  #returns an array of meal instances associated with this waiter

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end
  #returns the customer instances associated with the meal that recieved the best tip

end
