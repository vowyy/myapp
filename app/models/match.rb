class Match < ApplicationRecord
  belongs_to :meal
  belongs_to :japanese

  validates :ok, inclusion: { in: [true, false] }
  validates_uniqueness_of :meal_id, scope: :japanese_id
end

# == Schema Information
#
# Table name: matches
#
#  id          :bigint(8)        not null, primary key
#  budget      :integer          default(0), not null
#  ok          :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  japanese_id :bigint(8)
#  meal_id     :bigint(8)
#
# Indexes
#
#  index_matches_on_japanese_id              (japanese_id)
#  index_matches_on_meal_id                  (meal_id)
#  index_matches_on_meal_id_and_japanese_id  (meal_id,japanese_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (japanese_id => japaneses.id)
#  fk_rails_...  (meal_id => meals.id)
#
