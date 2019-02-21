class User < ApplicationRecord

has_many :sell_products, class_name: "Product", foreign_key: 'seller_id'
has_many :buy_products, class_name: "Product", foreign_key: 'buyer_id'


enum prefecture: {"---": 0,hokkaido:1,aomori:2,iwate:3,miyagi:4,akita:5,yamagata:6,fukushima:7,ibaraki:8,tochigi:9,gunma:10,saitama:11,chiba:12,tokyo:13,kanagawa:14,niigata:15,toyama:16,ishikawa:17,fukui:18,yamanashi:19,nagano:20,gifu:21,shizuoka:22,aichi:23,mie:24,shiga:25,kyoto:26,osaka:27,hyogo:28,nara:29,wakayama:30,tottori:31,shimane:32,okayama:33,hiroshima:34,yamaguchi:35,tokushima:36,kagawa:37,ehime:38,kochi:39,fukuoka:40,saga:41,nagasaki:42,kumamoto:43,oita:44,miyazaki:45,kagoshima:46,okinawa:47},_prefix: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :prefecture, :cities, :address, :birthday, presence: true

  validates :nickname, length: { maximum: 20 }
  validates :phone_number, length: { is: 11 }, if: :phone_number?
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/ } #全角文字のみ許容
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/ } #全角カタカナのみ許容
  validates :postal_code, length: { is: 7 }, if: :postal_code?
end
