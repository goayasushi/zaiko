class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.date :arrival_day, null: false
      t.integer :purchase_quantity, null: false
      t.references :user, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.timestamps
    end
  end
end
