class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
  has_many :comments
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶ一-]+\z/, message: 'には全角カタカナを使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶ一-]+\z/, message: 'には全角カタカナを使用してください' }
    validates :birthday
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
  end
end
