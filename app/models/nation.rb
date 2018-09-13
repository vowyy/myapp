class Nation < ApplicationRecord
  has_many :foreigners

  mount_uploader :flag, FlagUploader
end

# == Schema Information
#
# Table name: nations
#
#  id         :bigint(8)        not null, primary key
#  flag       :string(255)
#  name_en    :string(255)
#  name_ja    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
