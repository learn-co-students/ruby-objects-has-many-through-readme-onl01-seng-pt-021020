class Meal 
  #Meal class is a joining model between the Waiter and Customer class 
  #Meal class will maintain a single source of truth, and it will know all the details of each meal instance. 
  
  attr_accessor :waiter, :customer, :total, :tip 
  @@all = [] #all meals 
  
  def initialize(waiter, customer, total, tip = 0)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip 
    @@all << self 
  end 
  
  def self.all
    @@all
  end 
  



end