class Japaneses::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    build_resource
    yield resource if block_given?
    render layout: 'application_japanese'
  end

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        redirect_to jhome_path
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        redirect_to jhome_path
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render action: :new, layout: 'application_japanese'
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :birthday, :intro, :lang_l, :image, :gender])
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
