class Waiter
  attr_reader :name, :years

  @@all = []

  def initialize(name, years)
    @name = name
    @years = years
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new( self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    best_tip_meal = meals.max do |f_meal, s_meal|
      f_meal.tip <=> s_meal.tip
    end

    best_tip_meal.customer
  end
end
