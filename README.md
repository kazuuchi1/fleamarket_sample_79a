
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nick_name|string|null: false|
|email|string|null: false, unique: true, index:true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_name|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|introduction|text||
|user_image|string||
### Association
- has_one :sending_destinations
- has_one :credit_cards
- has_one :street_address
- has_many :products
- has_many :payment_information
- has_many :purchase_history


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|string|null: false|
|status|string|null: false|
|size|string|null: false|
|judgment|string|null: false|
|cost|integer|null: false|
|days|integer|null: false|
|shipping_method|string|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :users
- belongs_to :categories
- belongs_to :brand
- has_many :product_images


## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_last_name|string|null: false|
|destination_first_name|string|null: false|
|destination_last_name_kana|string|null: false|
|destination_first_name_kana|string|null: false|
|post_code|intrger|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
|user_id|reference|null: false, foreign_key: true|
### Association
- has_one :users
- has_one :purchase_goods



## street_addressテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|intrger|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
### Association
- has_one :users


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|intrger|null: false, unique: true|
|expiration_year|intrger|null: false|
|expiration_month|intrger|null: false|
|security_code|intrger|null: false|
|user_id|reference|null: false, foreign_key: true|
### Association
- has_one :users
- has_many :payment_information


## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|product_id|intrger|null: false|
|purchase_id|intrger|null: false|
|image|string|null: false|
### Association
- belongs_to :products


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :products


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :products


## payment_informationテーブル
|Column|Type|Options|
|------|----|-------|
|settlement_amount|intrger|null: false|
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :users
- belongs_to :credit_cards


## purchase_historyテーブル
|Column|Type|Options|
|------|----|-------|
|purchase_goods|reference|null: false, foreign_key: true|
|pay_method|string|null: false|
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :users
- has_many :purchase_goods


## purchase_goodsテーブル
|Column|Type|Options|
|------|----|-------|
|purchase_goods|reference|null: false, foreign_key: true|
### Association
- belongs_to :purchase_history
- has_one :sending_destinations
