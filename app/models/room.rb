class Room < ApplicationRecord
  belongs_to :match
  belongs_to :foreigner
  belongs_to :japanese
  belongs_to :meal
  has_many :messages, dependent: :destroy

  validates :match_id, presence: true
  validates :meal_id, presence: true, uniqueness: true
  validates :japanese_id, presence: true
  validates :foreigner_id, presence: true
end

# == Schema Information
#
# Table name: rooms
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  foreigner_id :bigint(8)        not null
#  japanese_id  :bigint(8)        not null
#  match_id     :bigint(8)        not null
#  meal_id      :bigint(8)        not null
#
# Indexes
#
#  index_rooms_on_foreigner_id  (foreigner_id)
#  index_rooms_on_japanese_id   (japanese_id)
#  index_rooms_on_match_id      (match_id) UNIQUE
#  index_rooms_on_meal_id       (meal_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (foreigner_id => foreigners.id)
#  fk_rails_...  (japanese_id => japaneses.id)
#  fk_rails_...  (match_id => matches.id)
#  fk_rails_...  (meal_id => meals.id)
#
