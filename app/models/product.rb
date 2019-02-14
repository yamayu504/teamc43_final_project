class Product < ApplicationRecord


has_many :product_images, dependent: :destroy
has_many :p_images, through: :product_images
belongs_to :brand, optional: true
belongs_to :category
belongs_to :seller, class_name: "User"
belongs_to :buyer,  class_name: "User", optional: true
#like機能実装時に作成
#has_many :likes
enum condition:{"---": 0, "新品、未使用": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3,"傷や汚れあり": 4, "全体的に状態が悪い": 5}
enum select_shipping_fee: {"---": 0, "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2},_prefix: true
enum shipping_method: {"---": 0,未定: 1, らくらくメルカリ便: 2, ゆうメール: 3, レターパック: 4,"普通郵便(定形、定形外)":5, クロネコヤマト: 6, ゆうパック: 7, クリックポスト:8, ゆうパケット:9},_prefix: true
enum area: { "---": 0,hokkaido:1,aomori:2,iwate:3,miyagi:4,akita:5,yamagata:6,fukushima:7,ibaraki:8,tochigi:9,gunma:10,saitama:11,chiba:12,tokyo:13,kanagawa:14,niigata:15,toyama:16,ishikawa:17,fukui:18,yamanashi:19,nagano:20,gifu:21,shizuoka:22,aichi:23,mie:24,shiga:25,kyoto:26,osaka:27,hyogo:28,nara:29,wakayama:30,tottori:31,shimane:32,okayama:33,hiroshima:34,yamaguchi:35,tokushima:36,kagawa:37,ehime:38,kochi:39,fukuoka:40,saga:41,nagasaki:42,kumamoto:43,oita:44,miyazaki:45,kagoshima:46,okinawa:47},_prefix: true
enum shipping_date:{"---": 0,"1日~2日で発送": 1,"2日~3日で発送": 2,"4日~7日で発送": 3},_prefix: true

validates :name, :description, :size, :condition, :select_shipping_fee, :shipping_method, :area, :shipping_date, :price, :category_id, presence: true
validates :name, length: { maximum: 40 }
validates :description, length: { maximum: 1000 }
validates :price, numericality: { greater_than_or_equal_to: 300,less_than:10000000}
# validates :size, :condition, :select_shipping_fee, :shipping_method, :area, :shipping_date, inclusion: { in: %w(---) }, on: :create
end
