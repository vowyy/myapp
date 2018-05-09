module JapanesesHelper
  def full_name(japanese)
    "#{japanese.last_name} #{japanese.first_name}"
  end
end
