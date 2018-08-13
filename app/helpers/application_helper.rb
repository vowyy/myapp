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

  private

  def store_location
    session[:previous_url] = request.original_url if request.get?
  end
end
