class Language < ApplicationRecord
  has_many :japaneses

  has_many :has_first_langs, class_name: "Foreigner", foreign_key: 'flng_id'
  has_many :get_second, through: :has_first_langs, source: :slng
  # @spanish = Language.find_by(lang: "Spanish")
  # @spanish.has_first_langs => Forignerのなかでflng_idがSpanishのレコード全て
  # @spanish.get_second  => flng_idがSpanishのForeingerのslng_idすべて

  has_many :has_second_langs, class_name: "Foreigner", foreign_key: 'slng_id'
  has_many :get_first, through: :has_second_langs, source: :flng

  def pick_locale
    I18n.locale == :ja ? lang_ja : lang_en
  end
end

# == Schema Information
#
# Table name: languages
#
#  id         :bigint(8)        not null, primary key
#  lang_en    :string(255)      not null
#  lang_ja    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
