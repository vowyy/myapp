class Location < ApplicationRecord
  belongs_to :prefecture
end

# == Schema Information
#
# Table name: locations
#
#  id            :bigint(8)        not null, primary key
#  location      :string(255)
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
