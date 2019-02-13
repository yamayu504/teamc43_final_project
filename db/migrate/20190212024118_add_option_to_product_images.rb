class AddOptionToProductImages < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :product_images, :products, column: :product_id
    add_foreign_key :product_images, :p_images, column: :p_image_id
  end
end
