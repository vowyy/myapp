class Foreigner < ApplicationRecord
  belongs_to :nation
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,     format: { with: VALID_EMAIL_REGEX }
  validates :name,      presence: true, length: { maximum: 50 }
  validates :gender,    presence: true, on: :update
  validates :birthday,  presence: true, on: :update
  validates :j_l,       presence: true, on: :update
  validates :nation_id, presence: true, on: :update
  validates :intro,     length: { maximum: 255 }
  validates :provider,  presence: true
  validates :uid,       presence: true

  # mount_uploader :image, ImageUploader
  # imageカラムとcarrierwaveで生成されたimageuploaderを結びつける。

  enum gender: { male: 0, female: 1, else: 2 }
  enum j_l: { beginner: 0, intermediate: 1, advanced: 2 }

  def new_comer?
    created_at > 1.minute.ago
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |foreigner|
      foreigner.email = auth.info.email
      foreigner.uid      = auth.uid
      foreigner.provider = auth.provider
      foreigner.password = Devise.friendly_token[0, 20]
      foreigner.name     = auth.info.name
      foreigner.image    = auth.info.image.gsub('http://', 'https://')
    end
  end

  # 現在のパスワードなしでupdateするオーバーライド
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
# Table name: foreigners
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
#  gender                 :integer
#  image                  :string(255)
#  intro                  :text(65535)
#  j_l                    :integer
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  provider               :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  uid                    :bigint(8)
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  nation_id              :bigint(8)
#
# Indexes
#
#  index_foreigners_on_confirmation_token    (confirmation_token) UNIQUE
#  index_foreigners_on_email                 (email) UNIQUE
#  index_foreigners_on_nation_id             (nation_id)
#  index_foreigners_on_reset_password_token  (reset_password_token) UNIQUE
#
