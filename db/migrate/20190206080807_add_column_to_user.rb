class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string, limit: 20, null:false
    add_column :users, :last_name, :string, null:false
    add_column :users, :first_name, :string, null:false
    add_column :users, :last_name_kana, :string, null:false
    add_column :users, :first_name_kana, :string, null:false
    add_column :users, :phone_number, :string, null:false, unique:true
    add_column :users, :postal_code, :string
    add_column :users, :prefecture, :integer, null:false, default: 0
    add_column :users, :cities, :string, null:false
    add_column :users, :address, :string, null:false
    add_column :users, :building_name, :string
    add_column :users, :birthday, :datetime, null:false
    add_column :users, :icon_image, :string
    add_column :users, :profile, :text
  end
end
