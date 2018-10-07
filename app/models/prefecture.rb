class Prefecture < ApplicationRecord
  has_many :locations, dependent: :destroy

  def pick_locale
    I18n.locale == :ja ? name_ja : name_en
  end
end

# == Schema Information
#
# Table name: prefectures
#
#  id         :bigint(8)        not null, primary key
#  name_en    :string(255)
#  name_ja    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
