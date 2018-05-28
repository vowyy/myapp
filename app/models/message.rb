class Message < ApplicationRecord
end

# == Schema Information
#
# Table name: messages
#
#  id         :bigint(8)        not null, primary key
#  content    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
