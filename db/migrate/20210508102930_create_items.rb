class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,            null: false
      t.references :user,                null: false, foreign_key: true
      t.text :description,               null: false
      t.integer :category_id,            null: false
      t.integer :status_id,              null: false
      t.integer :shipping_charge_id,     null: false
      t.integer :shipping_area_id,       null: false
      t.integer :shipping_day_id,        null: false
      t.integer :price,                  null: false
      t.timestamps
    end
  end
end
