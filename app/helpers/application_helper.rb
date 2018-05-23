module ApplicationHelper

  def japanese?
    current_japanese && current_foreigner.nil?
  end

  def foreigner?
    current_foreigner && current_japanese.nil?
  end
end
