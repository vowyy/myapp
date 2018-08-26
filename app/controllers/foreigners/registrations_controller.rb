# frozen_string_literal: true

class Foreigners::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

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
      redirect_to foreigner_path current_user, layout: 'personal_user'
    else
      clean_up_passwords resource
      set_minimum_password_length
      render action: :edit, layout: 'personal_user'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :j_l, :flng_id, :slng_id, :image, :gender, :nation_id])
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
