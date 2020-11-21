class CreateProductImages < ActiveRecord::Migration[6.0]
  def change
    create_table :product_images do |t|
      t.string :image, null: false
      t.timestamps
    end
  end
end
