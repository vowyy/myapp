class MatchMailer < ApplicationMailer
  def meal_offer(meal, match)
    @match = match
    @meal = meal
    @foreigner = meal.foreigner

    mail to: @foreigner.email, subject: "Your meal has been offered!"
  end
end
