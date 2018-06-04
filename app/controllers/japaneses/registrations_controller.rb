class Japaneses::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :birthday, :intro, :lang_l, :image, :gender])
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
