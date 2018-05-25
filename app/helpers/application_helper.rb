module ApplicationHelper
  def japanese?
    japanese_signed_in? && !foreigner_signed_in?
  end

  def foreigner?
    !japanese_signed_in? && foreigner_signed_in?
  end

  def current_user_exists?
    japanese_signed_in? || foreigner_signed_in?
  end
end
