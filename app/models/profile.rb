class Profile < ApplicationRecord
  belongs_to :profilable, polymorphic: true

  validates :intro, presence: true
  validate :short_intro

  INTRO_SHORTENED_SIZE  = 25
  INTRO_LIMITATION_SIZE = 1000

  def shorten_intro
    intro.scan(/\w+/).slice(0..22).join(" ") + " ....." if intro.scan(/\w+/).size > INTRO_SHORTENED_SIZE
  end

  private

  def short_intro
    errors[:base] << "Too long introduction." if intro.size > INTRO_LIMITATION_SIZE
  end
end

# == Schema Information
#
# Table name: profiles
#
#  id              :bigint(8)        not null, primary key
#  intro           :text(65535)
#  profilable_type :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  profilable_id   :bigint(8)        not null
#
# Indexes
#
#  index_profiles_on_profilable_type_and_profilable_id  (profilable_type,profilable_id)
#
