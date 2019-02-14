class AddOptionToProduct < ActiveRecord::Migration[5.0]
  def change
    change_column_null :products, :seller_id, false
  end
end
