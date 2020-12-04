class Product < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :buyer
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, 
  allow_destroy: true
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :images
  has_one :purchase_history


  mount_uploader :src, ImageUploader
  belongs_to :products, optional: true

  validates :src, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end