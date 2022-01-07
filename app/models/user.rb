class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname, presence: true
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
    # validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: '半角英数字を使用してください' }
    # validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: '半角英数字を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナを使用してください' }
    validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナを使用してください' }
    validates :birthday, presence: true
end