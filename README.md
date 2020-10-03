
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
|birthday|date|null: false|
|introduction|text||
|user_image|string||
### Association
- has_one :sending_destination
- has_one :street_address
- has_many :products
- has_many :payment_informations
- has_many :purchase_histories
- has_many :credit_cards


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|status|string|null: false|
|size|string|null: false|
|cost|integer|null: false|
|days|integer|null: false|
|shipping_method|string|null: false|
|category|reference|null: false, foreign_key: true|
|brand|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :product_images


## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_last_name|string|null: false|
|destination_first_name|string|null: false|
|destination_last_name_kana|string|null: false|
|destination_first_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|building_name|string|null: false|
|phone_number|integer|null: false|
|user|reference|null: false, foreign_key: true|
### Association
- has_one :user
- has_one :purchase_product



## street_addressテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
|user|reference|null: false, foreign_key: true|
### Association
- belongs_to :user


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|customer|reference|null: false, foreign_key: true|
|card|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :payment_informations


## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, index: true|
|image|string|null: false|
### Association
- belongs_to :product


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
|name|string|null: false|
### Association
- has_many :products


## payment_informationテーブル
|Column|Type|Options|
|------|----|-------|
|settlement_amount|integer|null: false|
|user|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :credit_card


## purchase_historyテーブル
|Column|Type|Options|
|------|----|-------|
|purchase_product|reference|null: false, foreign_key: true|
|pay_method|string|null: false|
|user|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :purchase_products


