class Room < ApplicationRecord
  belongs_to :match
end

# == Schema Information
#
# Table name: rooms
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  match_id   :bigint(8)
#
# Indexes
#
#  index_rooms_on_match_id  (match_id)
#
# Foreign Keys
#
#  fk_rails_...  (match_id => matches.id)
#
