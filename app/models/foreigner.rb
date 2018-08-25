class Foreigner < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  belongs_to :nation, optional: true
  has_many :meals, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :messages, as: :messable, dependent: :destroy
  has_one  :profile, as: :profilable, dependent: :destroy

  mount_uploader :image, ImageUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,     format: { with: VALID_EMAIL_REGEX }
  validates :name,      presence: true, length: { maximum: 50 }
  validates :gender,    presence: true, on: :update
  validates :age,       presence: true, numericality: { greter_than: 20, less_than: 50 }, on: :update
  validates :j_l,       presence: true, on: :update
  validates :f_lang,    presence: true, on: :update
  validates :nation_id, presence: true, on: :update
  validates :provider,  presence: true
  validates :uid,       presence: true
  
  validate :chose_same_lang?, on: :update

  enum gender: { male: 0,
                 female: 1,
                 else: 2 }

  enum j_l: { beginner: 0,
              intermediate: 1,
              advanced: 2 }

  enum f_lang: {
                 English: 0,
                 Spanish: 1,
                 Chinese: 2,
                 Korean: 3,
                 Hindi: 4,
                 Arabic: 5,
                 Italian: 6,
                 Russian: 7,
                 German: 8,
                 Portuguese: 9 }, _suffix: true

  enum s_lang: {
                none: 0,
                English: 1,
                Spanish: 2,
                Chinese: 3,
                Korean: 4,
                Hindi: 5,
                Arabic: 6,
                Italian: 7,
                Russian: 8,
                German: 9,
                Portuguese: 10 }, _suffix: true

  def new_comer?
    created_at > 1.minute.ago
  end

  # 新たなカラム追加する場合、ストロングパラメーターに追加しないとforeignerは作成されないので注意。
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |foreigner|
      foreigner.email            = auth.info.email
      foreigner.uid              = auth.uid
      foreigner.provider         = auth.provider
      foreigner.password         = Devise.friendly_token[0, 20]
      foreigner.name             = auth.info.name
      image_url                  = auth.info.image.to_s + "?type=large"
      foreigner.remote_image_url = image_url.gsub('http://', 'https://')
    end
  end

  # 現在のパスワードなしでupdateするオーバーライド
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

  def chose_same_lang?
    errors.add(:s_lang, "is identical with First language.") if f_lang == s_lang
  end
end

# == Schema Information
#
# Table name: foreigners
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
#  f_lang                 :integer
#  gender                 :integer
#  image                  :string(255)
#  j_l                    :integer
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  provider               :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  s_lang                 :integer
#  sign_in_count          :integer          default(0), not null
#  uid                    :bigint(8)
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  nation_id              :integer
#
# Indexes
#
#  index_foreigners_on_confirmation_token    (confirmation_token) UNIQUE
#  index_foreigners_on_email                 (email) UNIQUE
#  index_foreigners_on_nation_id             (nation_id)
#  index_foreigners_on_reset_password_token  (reset_password_token) UNIQUE
#
