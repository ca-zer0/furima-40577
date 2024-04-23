class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
         validates :password, format: { with: VALID_PASSWORD_REGEX, message: "パスワードには半角英字と半角数字の両方を含めて設定してください"}

         VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/

         VALID_NAME_KEY_REGEX = /\A[ァ-ヶー]+\z/

         with_options presence: true do
         validates :nickname
         validates :family_name, format: { with: VALID_NAME_REGEX, message: "全角ひらがな、全角カタカナ、漢字で入力してください" }
         validates :first_name, format: { with: VALID_NAME_REGEX, message: "全角ひらがな、全角カタカナ、漢字で入力してください" }
         validates :family_name_key, format: { with: VALID_NAME_KEY_REGEX, message: "全角カタカナで入力してください" }
         validates :first_name_key, format: { with: VALID_NAME_KEY_REGEX, message: "全角カタカナで入力してください" }
         validates :birthday
         end

         has_many :items 
        #  has_many :order
         
end
