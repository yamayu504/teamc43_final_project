## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|phone_number|string|null: false, unique: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string||
|prefecture|integer|null: false|
|cities|string|null: false|
|address|string|null: false|
|building_name|string||
|birthday|datetime|null: false|
|icon_image|string||
|profile|text||

### Association
- has_many :likes
- has_many :liked_products, class_name: "Product", through:likes
- has_many :sell_products, class_name: "Product", foreign_key: 'seller_id'
- has_many :buy_products, class_name: "Product", foreign_key: 'buyer_id'


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|description|text|null: false|
|size|integer|null: false|
|brand_id|reference|foreign_key: true|
|condition|integer|null: false|
|select_shipping_fee|integer|null: false|
|shipping_method|integer|null: false|
|area|integer|null: false|
|shipping_date|integer|null: false|
|price|integer|null: false|
|seller_id|reference|foreign_key: true|
|buyer_id|reference|foreign_key: true|
|for_sale|integer||
|deal|integer||
|category_id|reference|foreign_key: true|

* shipping_feehは出品者負担か購入者負担かを示すカラム
* shipping_dateは発送するまでの目安日数（１〜２日、３〜４日）を表すカラム
* for_saleは販売中かどうかを示すカラム
* sold_outは売り切れたかどうかを示すカラム
* for_sale,sold_outを作ることで販売、出品停止、取引中、売切れを表現

### Association
- has_many :likes
- has_one :product_images
- has_many :images, through:product_images
- belongs_to :user
- belongs_to :bland
- belongs_to :category
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"


## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|reference|foreign_key: true|
|p_image_id|reference|foreign_key: true|

### Association
- belongs_to :product
- belongs_to :p_image


## p_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string||

### Association
- has_one :product_images
- has_one :product, through:product_images


## likesテーブル

|column|Type|Options|
|------|----|-------|
|product_id|reference|foreign_key: true|
|user_id|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## brandsテーブル

|column|Type|Options|
|------|----|-------|
|name|string|unique: true|
|group_name|string||
|name_initial|string||

### Association
- has_many :products

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|unique: true, null: false|
|parent_id|integer||

### Association
- has_many :products
- has_many :sizes, through:category_sizes

## category_sizesテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|reference|foreign_key: true|
|size_id|reference|foreign_key:true|

### Association
- belongs_to :category
- belongs_to :size

## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|size|string||

### Association
- has_many :category_sizes
- has_many :categories, through:category_sizes

## reviewsテーブル

|Column|Tipe|Options|
|------|----|-------|
|seller_id|integer||
|buyer_id|integer||
|seller_review|string||
|buyer_review|string||
|seller_fb|integer||
|buyer_fb|integer||
|product_id|reference|foreign_key: true|

### Association
-belongs_to :product







