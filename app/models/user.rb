class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128

  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_KANA_REGEX = /\A[ァ-ン]+\z/.freeze

  validates :email, presence: true
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :family_katakana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_katakana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :birthday, presence: true
end
