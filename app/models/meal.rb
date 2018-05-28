class Meal < ApplicationRecord
  belongs_to :foreigner
  has_one :matches

  validates :date_time,    presence: true
  validates :lang,         presence: true
  validates :location,     presence: true
  validates :p_num,        presence: true
  validates :foreigner_id, presence: true
  validate :date_time_cannot_be_in_the_past

  enum lang: { English: 0, Chainese: 1, Spanish: 2, Italian: 3, French: 4, German: 5, Krean: 6, Hindi: 7, Russian: 8, Portuguese: 9, Malaysian: 10, Indonesian: 11 }
  enum location: { shinjyuku: 0, shibuya: 1, sinagawa:3  }

  private

  def date_time_cannot_be_in_the_past
    if date_time.present? && date_time < Date.current
      errors.add(:date, "is past.")
    end
  end
end

# 同一人物による同じ日の同じ時間帯のmealを作れない要する。

# == Schema Information
#
# Table name: meals
#
#  id           :bigint(8)        not null, primary key
#  date_time    :date
#  lang         :integer
#  location     :integer
#  p_num        :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  foreigner_id :bigint(8)
#
# Indexes
#
#  index_meals_on_foreigner_id  (foreigner_id)
#
