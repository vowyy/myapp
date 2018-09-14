class ContactMailer < ApplicationMailer
  def contact_send(name, email, inquiry)
    @name    = name
    @email   = email
    @inquiry = inquiry

    mail to: "bilibuddy1234@gmail.com", subject: "お問い合わせが来ています"
  end
end
