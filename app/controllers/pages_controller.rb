class PagesController < ApplicationController
  def home
    @meals = Meal.order("RAND()").limit(2) 
  end
end
