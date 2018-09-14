class Japaneses::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    build_resource
    yield resource if block_given?
  end

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        redirect_to root_path
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        redirect_to root_path
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render action: :new
    end
  end

  def edit
    render layout: 'personal_user'
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name

      if current_japanese.profile.nil? || current_japanese.profile.intro.blank?
        redirect_to new_profile_path, layout: 'personal_user'
        flash[:success] = "自己紹介文を完成させてMealにオファーしましょう。"
      else
        redirect_to japanese_path current_japanese, layout: 'personal_user'
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render action: :edit, layout: 'personal_user'
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :age, :language_id, :lang_l, :image, :gender])
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
