class Location < ApplicationRecord
  belongs_to :prefecture
  has_many :meal

  def pick_location(current_user, path)
    current_user.class.name == "Foreigner" || path == "/" ? name_en : name_ja
  end
end

# == Schema Information
#
# Table name: locations
#
#  id            :bigint(8)        not null, primary key
#  name_en       :string(255)
#  name_ja       :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :bigint(8)
#
# Indexes
#
#  index_locations_on_prefecture_id  (prefecture_id)
#
# Foreign Keys
#
#  fk_rails_...  (prefecture_id => prefectures.id)
#
