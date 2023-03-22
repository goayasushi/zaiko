class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :client_name, null: false
      t.string :postcode, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.string :phone, null: false
      t.string :pic
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
