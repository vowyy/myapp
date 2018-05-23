class Match < ApplicationRecord
  belongs_to :meal
  belongs_to :foreigner
  belongs_to :japanese

  validates :ok, inclusion: { in: [true, false] }
end

# == Schema Information
#
# Table name: matches
#
#  id           :bigint(8)        not null, primary key
#  budget       :integer
#  ok           :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  foreigner_id :bigint(8)
#  japanese_id  :bigint(8)
#  meal_id      :bigint(8)
#
# Indexes
#
#  index_matches_on_foreigner_id  (foreigner_id)
#  index_matches_on_japanese_id   (japanese_id)
#  index_matches_on_meal_id       (meal_id)
#
# Foreign Keys
#
#  fk_rails_...  (foreigner_id => foreigners.id)
#  fk_rails_...  (japanese_id => japaneses.id)
#  fk_rails_...  (meal_id => meals.id)
#
