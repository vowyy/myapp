class MatchMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.match_mailer.meal_request.subject
  #
  def meal_request
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
