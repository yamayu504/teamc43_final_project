class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :prefecture, :cities, :address, :birthday, presence: true
  validates :nickname, length: { maximum: 20 }
  validates :phone_number, length: { is: 11 }
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/ } #全角文字のみ許容
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/ } #全角カタカナのみ許容
  validates :postal_code, length: { is: 7 }
end
