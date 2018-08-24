class Japanese < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :matches, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :messages, as: :messable, dependent: :destroy
  has_many :favors, dependent: :destroy
  has_one  :profile, as: :profilable, dependent: :destroy

  mount_uploader :image, ImageUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :last_name,  presence: true, length: { maximum: 15 }
  validates :nickname,   presence: true, length: { maximum: 15 }, on: :update
  validates :gender,     presence: true, on: :update
  validates :language,   presence: true, on: :update
  validates :lang_l,     presence: true, on: :update
  validates :age,        presence: true, on: :update
  validate :nickname_required

  # allow users to update their accounts without passwords
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  private

  def nickname_required
    errors.add(:nickname, "はローマ字のみで入力してください。") if !nickname.blank? && nickname !~ /\A[a-zA-Z]+\z/
  end
end

# == Schema Information
#
# Table name: japaneses
#
#  id                     :bigint(8)        not null, primary key
#  age                    :integer
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  gender                 :string(255)
#  image                  :string(255)
#  lang_l                 :string(255)
#  language               :string(255)
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
