class Nation < ApplicationRecord
  has_many :foreigners
end

# == Schema Information
#
# Table name: nations
#
#  id         :bigint(8)        not null, primary key
#  flag       :string(255)
#  nation     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
