class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128

  
  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_KANA_REGEX = /\A[ァ-ン]+\z/.freeze

  with_options presence: true do
    validates :email
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :nickname
    validates :family_name, format: { with: VALID_NAME_REGEX }
    validates :first_name, format: { with: VALID_NAME_REGEX }
    validates :family_katakana, format: { with: VALID_KANA_REGEX }
    validates :first_katakana, format: { with: VALID_KANA_REGEX }
    validates :birthday
  end
end
