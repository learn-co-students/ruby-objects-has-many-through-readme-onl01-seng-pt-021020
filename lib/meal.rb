class Meal
  attr_reader :waiter, :customer, :total, :tip


  # class variables
  @@all = []

  # class methods
  def self.all
    @@all
  end


  # instance methods
  def initialize(waiter, customer, total, tip=0)
    @@all << self

    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
  end

end
