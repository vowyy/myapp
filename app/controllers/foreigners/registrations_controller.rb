# frozen_string_literal: true

class Foreigners::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :intro, :j_l, :image, :gender])
     end

     def update_resource(resource, params)
       resource.update_without_current_password(params)
     end
end
