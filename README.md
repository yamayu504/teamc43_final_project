## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|integer|null: false|
|phone_number|integer|null: false, unique: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|integer||
|prefecture|integer|null: false|
|cities|string|null: false|
|address|string|null: false|
|building_name|strinhg||
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|icon_image|integer||
|profile|text||

### Association
- has_many :products
- has_many :likes

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_name|string|index: true, null: false|
|description|text|null: false|
|size|integer|null: false|
|brand_id|reference|foreign_key: true|
|condition|integer|null: false|
|shipping_fee|integer|null: false|
|shipping_method|integer|null: false|
|area|integer|null: false|
|shipping_day|integer|null: false|
|price|integer|null: false|
|user_id|reference|foreign_key: true|
|buyer_id|reference|foreign_key: true|
|release|integer||
|sold_out|integer||

### Association
- has_many :likes
- has_one :images
- belongs_to :user
- belongs_to :bland

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image1|integer|null: false|
|image2|integer||
|image3|integer||
|image4|integer||
|product_id|reference|foreign_key: true|

### Association
- belongs_to :product

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
|brand_name|string|unique: true|
|brand_name_cap|string|
|brand_group_name|string|

### Association
- has_many :products
