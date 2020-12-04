class CreateProductImages < ActiveRecord::Migration[6.0]
  def change
    create_table :product_images do |t|
      t.string :image, null: false, foreign_key: true
      t.string :src, null:false
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
