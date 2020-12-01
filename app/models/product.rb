class Product < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :buyer
  has_many :product_images, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_one :purchase_history

  mount_uploader :product_image, ImageUploader

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end