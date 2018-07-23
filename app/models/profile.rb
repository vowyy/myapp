class Profile < ApplicationRecord
  belongs_to :profilable, polymorphic: true

  validate :short_intro

  private
  def short_intro
    errors[:base] << "Too long introduction." if intro.size > 500
  end
end

# == Schema Information
#
# Table name: profiles
#
#  id              :bigint(8)        not null, primary key
#  intro           :text(65535)
#  profilable_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  profilable_id   :integer
#
