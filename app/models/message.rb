class Message < ApplicationRecord
  belongs_to :room
  belongs_to :messable, polymorphic: true

  validates :content, presence: true, length: { maximum: 100 }
end

# == Schema Information
#
# Table name: messages
#
#  id            :bigint(8)        not null, primary key
#  content       :text(65535)      not null
#  messable_type :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  messable_id   :bigint(8)        not null
#  room_id       :bigint(8)
#
# Indexes
#
#  index_messages_on_messable_type_and_messable_id  (messable_type,messable_id)
#  index_messages_on_room_id                        (room_id)
#
