class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable

         VALID_PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
         validates :password, format: { with: VALID_PASSWORD_REGIX }

         VALID_NAME_REGIX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/

         VALID_NAME_KEY_REGIX = /\A[ァ-ヶー]+\z/

         with_options presence: true, on: :create do
         validates :nickname
         validates :family_name,format: { with: VALID_NAME_REGIX }
         validates :first_name,format: { with: VALID_NAME_REGIX }
         validates :family_name_key, format: { with: VALID_NAME_KEY_REGIX }
         validates :first_name_key, format: { with: VALID_NAME_KEY_REGIX }
         validates :birthday
         end

         has_many :items 
         has_many :order
         
end
