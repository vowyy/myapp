class Profile < ApplicationRecord
  belongs_to :profilable, polymorphic: true
end

# == Schema Information
#
# Table name: profiles
#
#  id              :bigint(8)        not null, primary key
#  profilable_type :string(255)
#  profile         :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  profilable_id   :integer
#
