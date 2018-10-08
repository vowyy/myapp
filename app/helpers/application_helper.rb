module ApplicationHelper
  def japanese?
    japanese_signed_in? && !foreigner_signed_in?
  end

  def foreigner?
    !japanese_signed_in? && foreigner_signed_in?
  end

  def current_user
    japanese? ? current_japanese : current_foreigner
  end

  def current_user_exists?
    japanese_signed_in? || foreigner_signed_in?
  end

  def redirect_back_or(default)
    redirect_to(session[:previous_url] || default)
    session.delete(:previous_url)
  end

  def from_root?
    request.path == '/'
  end

  def message_from_current_user?(message)
    message.messable_type.to_s.downcase == current_user.class.to_s.downcase
  end

  def japanese_related_page?
    japanese? || !from_root?
  end

  def authenticate!
    if current_user_exists?
      if I18n.locale == :ja
        :authenticate_japanese!
      elsif I18n.locale == :en
        :authenticate_foreigner!
      end
    end
  end

  private

  def store_location
    session[:previous_url] = request.original_url if request.get?
  end
end
