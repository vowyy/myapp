require 'test_helper'

class JapaneseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: japaneses
#
#  id                     :bigint(8)        not null, primary key
#  birthday               :date
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  gender                 :integer
#  image                  :string(255)
#  intro                  :text(65535)
#  lang_l                 :integer
#  last_name              :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  nickname               :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_japaneses_on_confirmation_token    (confirmation_token) UNIQUE
#  index_japaneses_on_email                 (email) UNIQUE
#  index_japaneses_on_first_name            (first_name)
#  index_japaneses_on_last_name             (last_name)
#  index_japaneses_on_nickname              (nickname)
#  index_japaneses_on_reset_password_token  (reset_password_token) UNIQUE
#
