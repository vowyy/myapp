class Meal < ApplicationRecord
  belongs_to :foreigner
  belongs_to :location
  has_many :matches, dependent: :destroy
  has_many :favors, dependent: :destroy
  has_many :japanese, through: :favors
  has_one  :room, dependent: :destroy

  NOBODY_IS_CHOSEN      = 0
  EXCESSIVE_ARE_CHOSEN  = 3
  MEAL_SAIZ_LIMITATION  = 5

  validates :date,         presence: true
  validates :time,         presence: true
  validates :skype,        inclusion: { in: [true, false] }
  validates :male,         numericality: { less_than: 4 }
  validates :female,       numericality: { less_than: 4 }
  validates :foreigner_id, presence: true
  validates :location_id,  presence: true

  validate :date_time_cannot_be_in_the_past
  validate :nobody_is_chosen
  validate :excessive_is_chosen

  def self.size_over?(foreigner)
    where(foreigner_id: foreigner).size < MEAL_SAIZ_LIMITATION
  end

  def already_offered?
    matches.exists?
  end

  def count_offer
    matches.where(meal_id: self, ok: 0).size
  end

  def already_matched?
    room
  end

  private

  def date_time_cannot_be_in_the_past
    errors.add(:date, "is past.") if date.present? && date < Date.current
  end

  def nobody_is_chosen
    errors[:base] << "Please select more than one person." if male + female == NOBODY_IS_CHOSEN
  end

  def excessive_is_chosen
    errors[:base] << "Please select less than three people." if male + female > EXCESSIVE_ARE_CHOSEN
  end
end

# 同一人物による同じ日の同じ時間帯のmealを作れない要する。

# == Schema Information
#
# Table name: meals
#
#  id           :bigint(8)        not null, primary key
#  date         :date
#  female       :integer          not null
#  male         :integer          not null
#  note         :text(65535)
#  skype        :boolean
#  time         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  foreigner_id :bigint(8)
#  location_id  :bigint(8)
#
# Indexes
#
#  index_meals_on_foreigner_id  (foreigner_id)
#  index_meals_on_location_id   (location_id)
#
