class Message < ApplicationRecord
  belongs_to :room
  belongs_to :foreigner
  belongs_to :japanese

end

# == Schema Information
#
# Table name: messages
#
#  id           :bigint(8)        not null, primary key
#  content      :text(65535)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  foreigner_id :bigint(8)
#  japanese_id  :bigint(8)
#  room_id      :bigint(8)
#
# Indexes
#
#  index_messages_on_foreigner_id  (foreigner_id)
#  index_messages_on_japanese_id   (japanese_id)
#  index_messages_on_room_id       (room_id)
#
