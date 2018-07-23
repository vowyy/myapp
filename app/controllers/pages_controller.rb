class PagesController < ApplicationController
  before_action :you_foreigner?, only: :jhome
  before_action :you_japanese?, only: :home

  def home
    @meals = Meal.order("RAND()").limit(5)
  end

  def jhome
    @meals = Meal.order("RAND()").limit(5)
    render layout: 'application_japanese'
  end

  private

  def you_foreigner?
    redirect_to root_path if foreigner?
  end

  def you_japanese?
    redirect_to jhome_path if japanese?
  end
end
