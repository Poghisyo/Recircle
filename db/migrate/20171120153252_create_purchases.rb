class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true, index: true
      t.references :material, foreign_key: true, index: true
      t.string :status
      t.integer :total_price
      t.boolean :insurance
      t.integer :shipping_cost
      t.integer :user_rating

      t.timestamps
    end
  end
end
