class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string       :name, unique:true
      t.string       :group_name
      t.string       :name_initial
      t.timestamps
    end
  end
end
