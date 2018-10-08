class Match < ApplicationRecord
  after_update :setup_room!

  belongs_to :meal
  belongs_to :japanese
  has_one :room, dependent: :destroy

  validates :ok, inclusion: { in: [true, false] }
  validates :japanese_id, presence: true
  validates :skype, inclusion: { in: [true, false] }
  validates :meal_id, presence: true, uniqueness: { scope: :japanese_id }

  private

  def setup_room!
    create_room!(meal_id: meal.id, foreigner_id: meal.foreigner_id, japanese_id: japanese_id)
  end
end

# == Schema Information
#
# Table name: matches
#
#  id          :bigint(8)        not null, primary key
#  budget      :integer          default(0), not null
#  ok          :boolean          default(FALSE)
#  skype       :boolean          not null
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
