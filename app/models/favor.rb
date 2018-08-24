class Favor < ApplicationRecord
  belongs_to :meal
  belongs_to :japanese

  validates :meal_id, presence: true, uniqueness: { scope: :japanese_id }
  validates :japanese_id, presence: true
end

# == Schema Information
#
# Table name: favors
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  japanese_id :bigint(8)
#  meal_id     :bigint(8)
#
# Indexes
#
#  index_favors_on_japanese_id  (japanese_id)
#  index_favors_on_meal_id      (meal_id)
#
# Foreign Keys
#
#  fk_rails_...  (japanese_id => japaneses.id)
#  fk_rails_...  (meal_id => meals.id)
#
