class Japanese < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :matches

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :last_name,  presence: true, length: { maximum: 10 }
  validates :gender,     presence: true, on: :update
  validates :lang_l,     presence: true, on: :update
  validates :birthday,   presence: true, on: :update
  validates :intro,      length: { maximum: 255 }

  # mount_uploader :image, ImageUploader

  enum gender: { male: 0, female: 1, else: 2 }
  enum lang_l: { beginner: 0, intermediate: 1, advanced: 2 }

  # allow users to update their accounts without passwords
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
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
#  index_japaneses_on_reset_password_token  (reset_password_token) UNIQUE
#
