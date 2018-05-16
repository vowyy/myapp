# frozen_string_literal: true

class Foreigners::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @foreigner = Foreigner.from_omniauth(request.env["omniauth.auth"])

    if @foreigner.persisted?
      if @foreigner.new_comer?
        sign_in @foreigner
        redirect_to edit_foreigner_registration_path @foreigner
        flash[:notice] = "signed in successfully with facebook. Please fill in the form below before you start"
      else
        sign_in_and_redirect @foreigner, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      end
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_foreingers_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
