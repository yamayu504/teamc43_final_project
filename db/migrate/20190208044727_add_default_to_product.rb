class AddDefaultToProduct < ActiveRecord::Migration[5.0]
  def change
      change_column_default :products, :category_id, 0
      change_column_default :products, :name, ""
  end
end
