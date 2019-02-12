class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table   :products do |t|
      t.string     :name, index: true,   null: false
      t.text       :description,         null: false
      t.integer    :condition,           null: false, default: 0
      t.integer    :size,                             default: 0
      t.integer    :select_shipping_fee, null: false, default: 0
      t.integer    :shipping_method,     null: false, default: 0
      t.integer    :area,                null: false, default: 0
      t.integer    :shipping_date,       null: false, default: 0
      t.integer    :price,               null: false
      t.references :seller
      t.references :buyer
      t.integer    :for_sale,            null: false, default: 0
      t.integer    :deal,                null: false, default: 0
      t.references :category,            null: false
      t.references :brand
      t.timestamps
    end
  end
end
