# frozen_string_literal: true

class Foreigners::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def edit
    render layout: 'personal_foreigner'
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
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      render action: :edit, layout: 'personal_foreigner'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :intro, :j_l, :f_lang, :s_lang, :image, :gender, :nation_id])
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
