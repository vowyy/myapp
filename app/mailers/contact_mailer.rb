class ContactMailer < ApplicationMailer
  def contact_send(name, email, inquiry)
    @name    = name
    @email   = email
    @inquiry = inquiry

    mail to: "meeat.japan@gmail.com", subject: "お問い合わせが来ています"
  end
end
