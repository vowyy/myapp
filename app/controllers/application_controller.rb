class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  before_action :get_meal_instance
  before_action :set_locale
  before_action :authenticate!

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # これがないとviewで current_japanese.full_name みたいにdecoratarのメソッドが呼び出せない。
  def current_japanese
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
  end

  def current_foreigner
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
  end

  def set_locale
    if current_user_exists?
      japanese? ? I18n.locale = I18n.default_locale : I18n.locale = :en
    else
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end

  protected

  def get_meal_instance
    @meal = Meal.new
  end

  def authenticate!
    if japanese_signed_in?
      @current_user = current_japanese
      true
    else
      authenticate_foreigner!
    end
  end

  # protected
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthday, :intro, :lang_l, :image, :gender])
  #   # sanitizer == 清浄剤
  # end
end
