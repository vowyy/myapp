class MatchMailer < ApplicationMailer
  def meal_request(match)
    @match = match
    @foreigner = match.meal.foreigner

    mail to: @foreigner.email, subject: "Your meal has been requested!"
  end
end
