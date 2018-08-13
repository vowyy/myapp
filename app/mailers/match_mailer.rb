class MatchMailer < ApplicationMailer
  def meal_request(meal, match)
    @match = match
    @meal = meal
    @foreigner = meal.foreigner

    mail to: @foreigner.email, subject: "Your meal has been requested!"
  end
end
