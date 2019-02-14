class CreatePImages < ActiveRecord::Migration[5.0]
  def change
    create_table :p_images do |t|
      t.string :image
      t.timestamps
    end
  end
end
