require 'pry'
class Customer
  attr_accessor :name, :age 
  
  @@all = [] #all customers 
  
  def initialize(name, age)
    @name = name
    @age = age 
    @@all << self #self is a customer being added to @@all array
  end 
  
  def self.all
    @@all
  end 
  
  def new_meal(waiter, total, tip = 0)
    Meal.new(waiter, self, total, tip)
    #customer not taken in as an argument because self is customer. 
    #This method allows us to create new meals as a customer
    #Assosciate each new meal with the customer that created it. 
  end 
  
  def meals
    Meal.all.select do |meal|
      meal.customer == self 
    end 
    #iterating through every instance of Meal and returning only the ones whose meal's customer matches the current customer instance. 
  end 
  
  def waiters
    meals.map do |meal|
      meal.waiter 
    end 
    #we now want a list of all the waiters that our customer has interacted with. 
    #each meal is associated with a waiter, so to get every waiter
    #we take the array of all customer's meals 
    #map over it to get a NEW array, getting the waiter from each of those meals 
    
  end 
  
  
  
  
  
end