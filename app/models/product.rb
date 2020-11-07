class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to :buyer
  has_many :product_images, dependent: :destroy
end
