class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.date :shipping_day, null: false
      t.integer :sale_quantity, null: false
      t.references :user, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.timestamps
    end
  end
end
