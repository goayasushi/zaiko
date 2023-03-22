class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :part_name, null: false
      t.integer :purchase_price, null: false
      t.integer :selling_price, null: false
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.timestamps
    end
  end
end
