class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX }

         VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/

         VALID_NAME_KEY_REGEX = /\A[ァ-ヶー]+\z/

         with_options presence: true do
         validates :nickname
         validates :family_name,format: { with: VALID_NAME_REGEX }
         validates :first_name,format: { with: VALID_NAME_REGEX }
         validates :family_name_key, format: { with: VALID_NAME_KEY_REGEX }
         validates :first_name_key, format: { with: VALID_NAME_KEY_REGEX }
         validates :birthday

         has_many :items 
         has_many :order
         
end
